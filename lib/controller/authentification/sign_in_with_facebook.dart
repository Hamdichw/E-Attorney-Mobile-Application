import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthHandler {
  static Future<Map<String, dynamic>?> checkIfLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      final userData = await FacebookAuth.instance.getUserData();
      return userData;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      return userData;
    } else {
      print(result.status);
      print(result.message);
      return null;
    }
  }

  static Future<void> logout() async {
    await FacebookAuth.instance.logOut();
  }
}
