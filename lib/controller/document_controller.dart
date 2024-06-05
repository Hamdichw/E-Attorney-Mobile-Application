import 'dart:convert';
import 'dart:io';

import 'package:estichara/view/nav_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:open_filex/open_filex.dart';

import '../utils/function.dart';

class Document_Add extends GetxController {
  List<dynamic>? userDataList;
  List<Map<String, dynamic>>? docList;
  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    userDataList = await fetchData();
    if (userDataList != null) {
      await fetchDoc();
    }
    update();
  }

  Future<void> fetchDoc() async {
    try {
      docList = await getDocument();
      update();
    } catch (e) {
      print("Error fetching documents: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getDocument() async {
    try {
      String? token = await getToken();

      var headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };

      final response = await http.get(
        Uri.parse(
            'https://backendserver.cleverapps.io/documents/all/${userDataList![7]}'),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        // Ensure that jsonResponse is indeed a List<dynamic>
        // ignore: unnecessary_type_check
        if (jsonResponse is List<dynamic>) {
          // Convert each item in the list to a Map<String, dynamic>
          List<Map<String, dynamic>> documents =
              jsonResponse.cast<Map<String, dynamic>>();
          return documents;
        } else {
          print("Error: Invalid JSON response format");
          return []; // Return an empty list if the response is not in the expected format
        }
      } else {
        print("Error fetching documents: ${response.statusCode}");
        throw Exception("Error fetching documents: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception while fetching documents: $e");
      throw e;
    }
  }

  Future<void> AddDocument(
    PlatformFile file, // Change the parameter type to PlatformFile
    String title,
    String description,
  ) async {
    try {
      String? token = await getToken();
      var headers = {"Authorization": "Bearer ${token}"};

      // Create a File object from PlatformFile
      List<int> fileBytes =
          await File(file.path!).readAsBytes(); // Read file as bytes
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://backendserver.cleverapps.io/documents/${userDataList![7]}'),
      );

      request.files.add(http.MultipartFile.fromBytes(
        'file',
        fileBytes,
        filename: path.basename(file.path!),
      ));
      request.fields['title'] = file.name;
      request.fields['description'] = description;
      request.headers.addAll(headers);
      var response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        print("Success: $responseBody");
        await QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.success,
            text: 'Document Added seccessfully!',
            autoCloseDuration: Duration(seconds: 3),
            showConfirmBtn: false);
        await Get.offAll(NavBar(
          indx: 0,
        ));
        // Handle success
      } else {
        print("Failed with status code: ${response.statusCode}");
        // Handle failure
      }
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<void> DeleteDoc(int id) async {
    try {
      String? token = await getToken();

      var headers = {"Authorization": "Bearer $token"};
      final response = await http.delete(
          Uri.parse(
              'https://backendserver.cleverapps.io/documents/${userDataList![7]}/delete/$id'),
          headers: headers);
      print(id);
      print(response);
      if (response.statusCode == 200) {
        await QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.success,
            text: 'The document is deleted successfully!',
            autoCloseDuration: Duration(seconds: 3),
            showConfirmBtn: false);
        await Get.offAll(NavBar(
          indx: 0,
        ));
      } else {
        // Handle other status codes if needed
        print("Failed to delete document: ${response.statusCode}");
      }
    } catch (e) {
      // Handle exceptions
      print("Error deleting document: $e");
      throw e;
    }
  }

  Future<void> VerifSign(int id, String user) async {
    try {
      String? token = await getToken();

      var headers = {"Authorization": "Bearer $token"};
      final response = await http.get(
          Uri.parse(
              'https://backendserver.cleverapps.io/docs/Sign/verify?documentSignedId=$id&userName=$user'),
          headers: headers);

      if (response.statusCode == 200) {
        var message = jsonDecode(response.body);
        print(message['message']);
        if (message['message'] ==
            'Signature is valid for the given DocumentSigned ID and User ID.') {
          await QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.success,
              text: 'Signature is valid for this Document!',
              title: 'Valid !',
              autoCloseDuration: Duration(seconds: 4),
              showConfirmBtn: false);
        } else {
          await QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.warning,
              title: 'not valid',
              text: 'Signature is not valid for this Document!',
              autoCloseDuration: Duration(seconds: 4),
              showConfirmBtn: false);
        }
      } else {
        // Handle other status codes if needed
        print("Failed to verif document: ${response.statusCode}");
      }
    } catch (e) {
      // Handle exceptions
      print("Error deleting document: $e");
      throw e;
    }
  }

  Future<void> SignDoc(int id) async {
    try {
      String? token = await getToken();

      var headers = {"Authorization": "Bearer $token"};
      final response = await http.post(
          Uri.parse(
              'https://backendserver.cleverapps.io/docs/Sign/sign-document?documentId=$id&userId=${userDataList![7]}'),
          headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var message = jsonDecode(response.body);
        if (message['message'] == 'Document signed successfully. Signature: ') {
          await QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.info,
              title: 'check your email',
              text:
                  'An email has been sent to your Gmail account to complete the sign-up process.',
              autoCloseDuration: Duration(seconds: 3),
              showConfirmBtn: false);
        } else {
          await QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.error,
              text: 'Failed to sign the document!',
              autoCloseDuration: Duration(seconds: 4),
              showConfirmBtn: false);
        }
      } else {
        // Handle other status codes if needed
        print("Failed to delete document: ${response.statusCode}");
      }
    } catch (e) {
      // Handle exceptions
      print("Error deleting document: $e");
      throw e;
    }
  }

  Future<void> DownloadDoc(int id, String name) async {
    try {
      String? token = await getToken();

      var headers = {"Authorization": "Bearer $token"};
      final response = await http.get(
          Uri.parse(
              'https://backendserver.cleverapps.io/documents/$id/download'),
          headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Save the downloaded file
        final documentsDir = (await getApplicationDocumentsDirectory()).path;
        var localPath = '$documentsDir/$name';

        await File(localPath).writeAsBytes(response.bodyBytes);

        // Open the downloaded file
        await OpenFilex.open(localPath);
      } else {
        // Handle other status codes if needed
        print("Failed to downlaod document: ${response.statusCode}");
      }
    } catch (e) {
      // Handle exceptions
      print("Error downlaod document: $e");
      throw e;
    }
  }

  Future<void> ShareDocument(int id, String Email) async {
    try {
      String? token = await getToken();
      var headers = {"Authorization": "Bearer ${token}"};

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://backendserver.cleverapps.io/documents/shareMyDocument'),
      );

      request.fields['docId'] = '$id';
      request.fields['Email'] = Email;
      request.headers.addAll(headers);
      var response = await request.send();
      String responseBody = await response.stream.bytesToString();
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Success: $responseBody");
        await QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.success,
            text: 'Document Shared successfully!',
            autoCloseDuration: Duration(seconds: 3),
            showConfirmBtn: false);
        Navigator.of(Get.context!).pop();
        // Handle success
      } else {
        print("Failed with status code: ${response.statusCode}");
        // Handle failure
      }
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }
}
