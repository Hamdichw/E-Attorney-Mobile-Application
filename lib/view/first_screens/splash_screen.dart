import 'dart:async';

import 'package:estichara/utils/const.dart';
import 'package:estichara/view/first_screens/screen4.dart';
import 'package:get/get.dart';

import '/view/first_screens/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../nav_bar.dart';

bool? loggedin;
bool? FirstTime;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 1))
        ..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    // Add a delay and then navigate to the login page
    navigateToNextScreen().whenComplete(() async {
      Timer(
          Duration(seconds: 3),
          () => {
                if (FirstTime == false || FirstTime == null)
                  {Get.offAll(Controller())}
                else if (loggedin == true)
                  {Get.offAll(NavBar())}
                else
                  {Get.offAll(Screen4())}
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.infinity,
            color: btncolor,
            child: FadeTransition(
              opacity: _animation,
              child: Image(image: AssetImage("assets/images/First.png")),
            ),
          )
        ],
      ),
    );
  }
}
