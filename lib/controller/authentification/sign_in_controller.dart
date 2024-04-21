import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../utils/const.dart';
import '../../../utils/function.dart';
import 'package:flutter/material.dart';
import 'package:estichara/view/nav_bar.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool visible = true.obs;
  final RxBool remember = false.obs;

  void toggleVisibility() {
    visible.value = !visible.value;
  }

  Future<void> login() async {
    var headers = {"Content-Type": "application/json"};
    try {
      Map<String, dynamic> body = {
        "email": email.text,
        "password": password.text
      };
      final response = await http.post(
        Uri.parse("https://backendserver.cleverapps.io/ClientAuth/login"),
        body: jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData);
        var token = jsonData['token'];

        // Save token to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        // Save user data to SharedPreferences
        await prefs.setString('userData', jsonEncode(jsonData));

        // Optionally, save login status if needed
        if (remember.isTrue) {
          await prefs.setBool('isLoggedIn', true);
        }

        // Navigate to next screen
        Get.offAll(NavBar());
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Login Failed'),
              contentPadding: EdgeInsets.all(20),
              children: [Text('check email and password')],
            );
          },
        );
      }
    } catch (error) {
      // Handle errors
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Login Failed'),
            contentPadding: EdgeInsets.all(20),
            children: [Text('check email and password')],
          );
        },
      );
    }
  }
}
