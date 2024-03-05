import 'dart:async';

import 'package:estichara/view/first_screens/screen4.dart';
import 'package:get/get.dart';

import '/view/first_screens/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'nav_bar.dart';

bool? loggedin;
bool? FirstTime;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay and then navigate to the login page
    navigateToNextScreen().whenComplete(() async {
      Timer(
          Duration(seconds: 2),
          () => /* Get.to(FirstTime == false
              ? Controller()
              : loggedin 
                  ? Screen4()
                  : NavBar()) */
              {
                if (FirstTime == false || FirstTime == null)
                  {Get.to(Controller())}
                else if (loggedin == true)
                  {Get.to(NavBar())}
                else
                  Get.to(Screen4())
              });
    });
  }

  Future navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool('isLoggedIn');
    var firstLog = prefs.getBool('firstLog');
    setState(() {
      loggedin = isLoggedIn;
      FirstTime = firstLog;
    });
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Image(
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              image: AssetImage('assets/images/splash1.png')),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: CircularProgressIndicator(
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Colors.white,
              ),
            ),
          )

          ///thankyou
        ],
      ),
    );
  }
}
