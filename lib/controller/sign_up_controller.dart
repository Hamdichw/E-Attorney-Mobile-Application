import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../view/nav_bar.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool visible = true.obs;
  final RxBool remember = false.obs;
  void toggleVisibility() {
    visible.value = !visible.value;
  }

  Future<void> signUp() async {
    var headers = {"Content-Type": "application/json"};
    try {
      Map<String, dynamic> body = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text,
        "username": usernameController.text,
        "password": passwordController.text
      };
      final response = await http.post(
        Uri.parse("https://backendserver.cleverapps.io/ClientAuth/register"),
        body: jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        var token = json['token'];

        // Save token to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('userData', jsonEncode(json));
        // Optionally, save login status if needed
        if (remember.isTrue) {
          await prefs.setBool('isLoggedIn', true);
        }

        // Navigate to next screen
        Get.offAll(NavBar());
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(error.toString())],
          );
        },
      );
    }
  }

  Future<String> Verificationcode(String email) async {
    var headers = {"Content-Type": "application/json"};

    // Define your query parameters
    var queryParams = {
      'email': emailController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(
            "https://backendserver.cleverapps.io/ClientAuth/CodeVerification?email=${emailController.text}"),
        headers: headers,
        body: jsonEncode(queryParams),
      );

      if (response.statusCode == 200) {
        // If the request is successful, return the response body as a string
        return response.body;
      } else {
        // If the request fails, return an empty string or handle the error as needed
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return '';
      }
    } catch (e) {
      // Handle network errors
      print('Error: $e');
      return '';
    }
  }
}
