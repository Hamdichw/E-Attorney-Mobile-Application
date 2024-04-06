import 'dart:convert';

import 'package:get/get.dart';

import '../utils/function.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
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
              "https://backendserver.cleverapps.io/Appointments/notAccepted/2"),
          headers: headers,
        );
        if (response.statusCode == 200) {
          List<dynamic> responsedata = json.decode(response.body);
          return responsedata;
        } else {
          throw Exception('Failed to fetch data');
        }
      } else {
        throw Exception('Token is null'); // Handling case where token is null
      }
    } catch (error) {
      print("Error during Get request: $error");
      throw Exception('Error: $error');
      // Add your handling logic for errors
    }
  }
}
