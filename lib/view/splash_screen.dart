// ignore_for_file: prefer_const_constructors
import 'package:e_attorney_hub/view/page_controller.dart';
import 'package:flutter/material.dart';

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
        MaterialPageRoute(builder: (context) => const Controller()),
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
              image: AssetImage('images/splash1.png')),

          ///thankyou
        ],
      ),
    );
  }
}
