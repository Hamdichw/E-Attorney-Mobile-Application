import 'dart:convert';

import 'package:get/get.dart';

import '../utils/function.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
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

  Future<List<dynamic>> GetRequest() async {
    try {
      String? token = await getToken();
      if (token != null) {
        var headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        };
        final response = await http.get(
          Uri.parse(
              "https://backendserver.cleverapps.io/Appointments/notAccepted/${userDataList![7]}"),
          headers: headers,
        );
        if (response.statusCode == 200) {
          List<dynamic> responseData = json.decode(response.body);
          print(responseData);
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

  Future<List<dynamic>> GetAccept() async {
    try {
      String? token = await getToken();
      if (token != null) {
        var headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        };
        final response = await http.get(
          Uri.parse(
              "https://backendserver.cleverapps.io/Appointments/accepted/${userDataList![7]}"),
          headers: headers,
        );
        if (response.statusCode == 200) {
          List<dynamic> responseData = json.decode(response.body);
          print(responseData);
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
}
