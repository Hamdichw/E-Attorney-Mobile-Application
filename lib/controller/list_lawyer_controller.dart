import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';

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
          //print(responseData);
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
          await QuickAlert.show(
            autoCloseDuration: Duration(seconds: 4),
            context: Get.context!,
            type: QuickAlertType.success,
            text: 'Resquest added Succesefully!',
          );
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
