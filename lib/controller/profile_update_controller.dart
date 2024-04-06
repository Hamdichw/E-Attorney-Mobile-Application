import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/function.dart';

class UpdateProfileController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController vfpassword = TextEditingController();
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

  Future<void> updateProfile() async {
    try {
      final token = await getToken();

      if (token != null) {
        var headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        };
        Map<String, dynamic> body = {
          "username": name.text,
          "phoneNumber": phone.text,
          "email": email.text,
          "password": password.text
        };
        print(userDataList![7]);
        print(token);
        final response = await http.put(
            Uri.parse(
                "https://backendserver.cleverapps.io/ClientAuth/updateProfile/${userDataList![7]}"),
            headers: headers,
            body: jsonEncode(body));
        if (response.statusCode == 200) {
          // Handle successful update
          print("Profile updated successfully!");
        } else {
          throw Exception('Failed to update profile');
        }
      } else {
        throw Exception('Token is null');
      }
    } catch (error) {
      print("Error during profile update: $error");
      // Handle error
    }
  }
}
