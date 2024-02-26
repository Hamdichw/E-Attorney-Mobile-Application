import 'package:flutter/material.dart';

import 'view/add_doc_page.dart';
import 'view/details_page.dart';
import 'view/nav_bar.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavBar(),
  ));
}
