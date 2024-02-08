// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../view/Login.dart';

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
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const login()),
      );
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
              image: AssetImage('images/peakpx.jpg')),

          Align(
              alignment: Alignment.center,
              child: Image(
                  height: 300,
                  width: 300,
                  image: AssetImage('images/peakpx.jpg'))),

          ///thankyou
        ],
      ),
    );
  }
}
