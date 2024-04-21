import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin {
  static final googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();
  static Future<GoogleSignInAccount?> logout() => googleSignIn.disconnect();
}
