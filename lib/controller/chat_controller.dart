import 'package:get/get.dart';
import 'dart:convert';

import '../utils/function.dart';
import 'package:http/http.dart' as http;

class Chat_Controller extends GetxController {
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

  Future<List<dynamic>> GetAllChat() async {
    try {
      String? token = await getToken();
      if (token != null) {
        var headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        };
        final response = await http.get(
          Uri.parse(
              "https://backendserver.cleverapps.io/chats/all/${userDataList![7]}"),
          headers: headers,
        );
        if (response.statusCode == 200) {
          List<dynamic> responseData =
              json.decode(utf8.decode(response.bodyBytes));
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

  Future<Map<String, dynamic>?> fetchLastMessage(int chatId) async {
    try {
      String? token = await getToken();
      if (token == null) {
        return null;
      }

      var headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };

      final response = await http.get(
        Uri.parse(
            'https://backendserver.cleverapps.io/chats/last/message/from/chat/$chatId'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final dynamic jsonResponse =
            jsonDecode(utf8.decode(response.bodyBytes));
        Map<String, dynamic> chatMessage = jsonResponse;
        return chatMessage;
      } else {
        print("Error fetching last message: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception while fetching last message: $e");
      return null;
    }
  }
}
