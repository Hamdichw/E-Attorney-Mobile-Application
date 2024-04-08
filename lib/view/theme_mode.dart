import 'package:estichara/view/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme_service.dart';

class Mode extends StatefulWidget {
  const Mode({Key? key}) : super(key: key);

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  final Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Mode'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(NavBar(
              indx: 4,
            ));
          },
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Light'),
            onTap: () {
              themes.changeTheme(false); // Change to light theme
            },
          ),
          ListTile(
            title: Text('Dark'),
            onTap: () {
              themes.changeTheme(true); // Change to dark theme
            },
          )
        ],
      ),
    );
  }
}
