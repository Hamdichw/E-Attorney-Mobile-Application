import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:image/image.dart' as img;
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:estichara/view/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/sign_in_with_facebook.dart';
import '../controller/sign_in_with_google.dart';
import 'package:http/http.dart' as http;

import '../view/authentification/login.dart';

navigation(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

/* Snackbar */
void showSnackbar(BuildContext context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
    ),
  );
}

//*********************VALIDATORS****************** */
class Validators {
  /* Role Validation */
  static String? validateRole(String? value) {
    if (value == null || value.isEmpty) {
      return "!!";
    }
    return null; // Value is valid
  }

  /* Name Validation */
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Verifier votre Nom";
    } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
      return "Le nom ne doit contenir que des lettres et des espaces";
    } else {
      return null;
    }
  }

  /* LastName Validation */
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Verifier votre Prénom";
    } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
      return "Le Prénom ne doit contenir que des lettres et des espaces";
    } else {
      return null;
    }
  }

  /* Phone Number Validation */
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Verifier votre Numero";
    } else if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
      return "Le numéro de téléphone ne doit contenir que des chiffres";
    } else if (value.length < 8) {
      return "Le numéro de téléphone doit contenir 8 chiffres";
    } else {
      return null; // Validation passed
    }
  }

/* Mail Validation */
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Verifier votre Email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
        .hasMatch(value)) {
      return 'Veuillez saisir une adresse e-mail valide';
    }
    return null;
  }

  /* Password Validation */
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Verifier votre Mot de passe';
    } else if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    return null;
  }
}

Future<DateTime?> showDatePickerDialog(
    BuildContext context, DateTime date_now) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: date_now,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 365)),
  );
  return selectedDate;
}

Future<void> signIn() async {
  final user = await GoogleSignin.login();
  if (user == null) {
    Get.snackbar("Login", "Failed");
  } else {
    print(11);
    await loginwithgooglecustomize(user.displayName, user.email, user.photoUrl);
    print(1);
    // Save user data to SharedPreferences
  }
}

Future<void> loginwithgooglecustomize(
    String? username, String? email, String? profileImage) async {
  var headers = {"Content-Type": "application/json"};
  try {
    // Split username into first name and last name
    String firstName = '';
    String lastName = '';
    if (username != null) {
      List<String> parts = username.split(" ");
      firstName = parts[0];
      if (parts.length > 1) {
        lastName = parts.sublist(1).join(" ");
      }
    }

    Map<String, dynamic> body = {
      "email": email,
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "profileImage": profileImage
    };
    print(body);
    final response = await http.post(
      Uri.parse("https://backendserver.cleverapps.io/ClientAuth/loginGoogle"),
      body: jsonEncode(body),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      var token = json['token'];

      // Save token to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('userData', jsonEncode(json));
      await prefs.setBool('firstLog', true);
      await prefs.setBool('isLoggedIn', true);
      // Optionally, save login status if needed

      // Navigate to next screen
      Get.offAll(NavBar());
    } else {
      throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
    }
  } catch (error) {
    throw error;
  }
}

Future signInFacebook() async {
  final user = await FacebookAuthHandler.login();
  if (user == null) {
    Get.snackbar("login", "failed");
  } else {
    Get.to(NavBar());
  }
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<Map<String, dynamic>?> getUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userDataJson = prefs.getString('userData');
  if (userDataJson != null) {
    // Convert JSON string back to Map
    return jsonDecode(userDataJson);
  } else {
    return null;
  }
}

Future<List<dynamic>?> fetchData() async {
  try {
    // Retrieve user data from SharedPreferences
    Map<String, dynamic>? userData = await getUserData();
    if (userData != null) {
      String firstName = userData['firstName'] ?? '';
      String lastName = userData['lastName'] ?? '';
      String username = userData['username'] ?? '';
      String email = userData['email'] ?? '';
      String phone = userData['phoneNumber'] ?? '';
      String image = userData['profileImage'] != null
          ? userData['profileImage']
          : 'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg';

      String userInfo = userData['userInfo'] ?? '';
      int id = userData['userID'] ?? '';

      // Create a list containing user data
      List<dynamic> userDataList = [
        firstName,
        lastName,
        username,
        email,
        phone,
        image,
        userInfo,
        id
      ];
      // Return the list containing user data
      return userDataList;
    } else {
      // Handle scenario where user data is not available (user not logged in)
      print('User data not found');
      return null;
    }
  } catch (error) {
    // Handle error
    print('Error ya dali: $error');
    return null;
  }
}

Future<void> ResetPasswordFunction(String email) async {
  var headers = {
    "Content-Type": "application/x-www-form-urlencoded"
  }; // Define your query parameters
  Map<String, dynamic> body = {
    'email': email,
  };
  print(body);
  String encodedBody = body.keys
      .map((key) => "$key=${Uri.encodeComponent(body[key].toString())}")
      .join("&");
  try {
    final response = await http.post(
      Uri.parse("https://backendserver.cleverapps.io/ClientAuth/reset"),
      headers: headers,
      body: encodedBody,
    );

    if (response.statusCode == 200) {
      // If the request is successful, return the response body as a string

      await showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Succed'),
            contentPadding: EdgeInsets.all(20),
            children: [Text('new password send to your email')],
          );
        },
      );
      Get.off(Login());
    } else {
      // If the request fails, return an empty string or handle the error as needed
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    // Handle network errors
    print('Error: $e');
  }
}

Future<XFile> compressImage(XFile file) async {
  String targetPath =
      file.path; // You can specify a different target path if needed
  List<int> result = (await FlutterImageCompress.compressWithFile(
    targetPath,
    minHeight: 800,
    minWidth: 600,
    quality: 88,
  )) as List<int>;
  String fName = file.name;
  Directory appDocDir = await getApplicationCacheDirectory();
  String appDocPath = appDocDir.path;
  String compressedImagePath = '$appDocPath/$fName.jpg';
  await File(compressedImagePath).writeAsBytes(result);

  return XFile(compressedImagePath);
}
