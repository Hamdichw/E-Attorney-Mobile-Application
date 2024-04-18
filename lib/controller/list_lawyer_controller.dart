import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/function.dart';

class List_Lawyer_Controller extends GetxController {
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

  Future<List<dynamic>> GetAllLawyer() async {
    try {
      String? token = await getToken();
      if (token != null) {
        var headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        };
        final response = await http.get(
          Uri.parse("https://backendserver.cleverapps.io/Get/AllLawyers"),
          headers: headers,
        );
        if (response.statusCode == 200) {
          List<dynamic> responseData = json.decode(response.body);
          return responseData;
        } else {
          throw Exception('Failed to fetch data');
        }
      } else {
        throw Exception('Token is null');
      }
    } catch (error) {
      print("Error during Get request: $error");
      throw Exception('Error: $error');
    }
  }

  static Future<void> AddRequest(int userID, int lawyerId, String date) async {
    try {
      String? token = await getToken();
      if (token != null) {
        var headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        };
        Map<String, dynamic> body = {
          "client": {"userID": userID},
          "lawyer": {"userID": lawyerId},
          "start": date
        };
        print(body);
        final response = await http.post(
          Uri.parse("https://backendserver.cleverapps.io/Appointments/request"),
          headers: headers,
          body: json.encode(body),
        );
        if (response.statusCode == 200) {
          Get.snackbar("Succes", "Resquest added Succesefully",
              isDismissible: false,
              duration: Duration(seconds: 5),
              backgroundColor: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.white,
                size: 35,
              ),
              snackStyle: SnackStyle.FLOATING);
        } else {
          throw Exception('Failed to send request');
        }
      } else {
        throw Exception('Token is null');
      }
    } catch (error) {
      print("Error during AddRequest: $error");
      throw Exception('Error: $error');
    }
  }
}
