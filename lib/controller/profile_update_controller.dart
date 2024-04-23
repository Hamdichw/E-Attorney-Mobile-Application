import 'dart:convert';
import 'dart:io';

import 'package:estichara/view/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/function.dart';

class UpdateProfileController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final RxBool visible = true.obs;
  final RxBool visible1 = true.obs;
  List<dynamic>? userDataList;
  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    userDataList = await fetchData();
    update();
  }

  void toggleVisibility() {
    visible.value = !visible.value;
  }

  void toggleVisibility1() {
    visible1.value = !visible1.value;
  }

  Future<void> updateProfilePhoto(XFile image) async {
    try {
      final token = await getToken();
      if (token != null) {
        var headers = {"Authorization": "Bearer $token"};

        // Open the file and read its bytes
        XFile img = await compressImage(image);
        List<int> imageBytes = await File(img.path).readAsBytes();

        // Create a FormData object to send the image file
        var request = http.MultipartRequest(
            'POST',
            Uri.parse(
                'https://backendserver.cleverapps.io/ClientAuth/${userDataList![7]}/profile-image'));

        // Add the image file to the FormData with the key 'image'
        request.files.add(http.MultipartFile.fromBytes(
          'image',
          imageBytes,
          filename: path.basename(image.path), // Extracting filename from path
        ));

        // Attach headers to the request
        request.headers.addAll(headers);

        // Send the request
        var response = await request.send();
        String responseBody = await response.stream.bytesToString();
        // Check the response
        if (response.statusCode == 200) {
          print("success");

          userDataList?[5] = responseBody; // Update image URL in userDataList
          updateUserDataInStorage(); // Update user data in storage
          Get.off(NavBar(
            indx: 4,
          ));
        } else {
          print("Failed with status code: ${response.statusCode}");
          // Print response body if needed
          // print(await response.stream.bytesToString());
        }
      } else {
        print("Failed to get token");
      }
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<void> updateProfile() async {
    try {
      final token = await getToken();

      if (token != null) {
        var headers = {
          'Accept': 'application/json',
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        };

        print(userDataList![7]);
        print(token);
        Map<String, dynamic>? body = toJson();

        // Add fields to be updated
        if (name.text.isNotEmpty) {
          body["username"] = name.text;
        }
        if (phone.text.isNotEmpty) {
          body["phoneNumber"] = phone.text;
        }
        if (bioController.text.isNotEmpty) {
          body["bio"] = bioController.text;
        }
        if (firstNameController.text.isNotEmpty) {
          body["firstName"] = firstNameController.text;
          print(["firstName"]);
        }
        if (lastNameController.text.isNotEmpty) {
          body["lastName"] = lastNameController
              .text; // Assuming first and last names are the same
        }
        if (email.text.isNotEmpty) {
          body["email"] = email.text;
        }
        if (password.text.isNotEmpty) {
          body["password"] = password.text;
        }
        print(body);
        final response = await http.put(
            Uri.parse(
                "https://backendserver.cleverapps.io/ClientAuth/${userDataList![7]}"),
            headers: headers,
            body: jsonEncode(body));

        if (response.statusCode == 200) {
          // Clear all fields
          name.clear();
          phone.clear();
          bioController.clear();
          firstNameController.clear();
          lastNameController.clear();
          email.clear();
          password.clear();
          // Handle successful update
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('userData', utf8.decode(response.bodyBytes));
          print("Profile updated successfully!");
          Get.snackbar('updated', 'succed',
              icon: Icon(
                Icons.done_rounded,
                color: Colors.white,
                size: 35,
              ),
              snackStyle: SnackStyle.FLOATING,
              backgroundColor: Colors.green[400]);
          Get.off(NavBar(
            indx: 4,
          ));
        } else {
          // Handle failed update
          Get.snackbar('updated', 'failed',
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.white,
                size: 35,
              ),
              snackStyle: SnackStyle.FLOATING,
              backgroundColor: Colors.red[400]);
          print(
              "Failed to update profile: ${response.body}${response.statusCode}");
          throw Exception('Failed to update profile');
        }
      } else {
        Get.snackbar('updated', 'failed',
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.white,
              size: 35,
            ),
            snackStyle: SnackStyle.FLOATING,
            backgroundColor: Colors.red[400]);

        // Handle case where token is null
        throw Exception('Token is null');
      }
    } catch (error) {
      Get.snackbar('updated', 'failed',
          icon: Icon(
            Icons.cancel_outlined,
            color: Colors.white,
            size: 35,
          ),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.red[400]);

      print("Error during profile update: $error");
      // Handle error
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': userDataList?[0],
      'lastName': userDataList?[1],
      'username': userDataList?[2],
      'email': userDataList?[3],
      'phoneNumber': userDataList?[4],
      'profileImage': userDataList?[5],
      'userInfo': userDataList?[6],
      'userID': userDataList?[7],
    };
  }

  Future<void> updateUserDataInStorage() async {
    try {
      // Update user data in SharedPreferences
      Map<String, dynamic> userDataJson = toJson();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userData', jsonEncode(userDataJson));
    } catch (error) {
      // Handle error
      print('Error updating user data: $error');
    }
  }
}
