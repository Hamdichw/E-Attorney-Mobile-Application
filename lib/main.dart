import 'package:e_attorney_hub/view/nav_bar.dart';
import 'package:e_attorney_hub/view/page_controller.dart';
import 'package:e_attorney_hub/view/profile_screen.dart';
import 'package:e_attorney_hub/view/first_screens/screen1.dart';
import 'package:e_attorney_hub/view/first_screens/screen2.dart';
import 'package:e_attorney_hub/view/first_screens/screen3.dart';
import 'package:e_attorney_hub/view/first_screens/screen4.dart';
import 'package:e_attorney_hub/view/splash_screen.dart';
import 'package:flutter/material.dart';

import 'view/notification_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavBar(),
  ));
}
