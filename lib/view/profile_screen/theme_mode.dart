import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:estichara/view/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../locale/locale_controller.dart';
import '../../utils/theme_service.dart';

class Mode extends StatefulWidget {
  const Mode({Key? key}) : super(key: key);

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  String selectedLanguage = '';
  final box = GetStorage();
  final Themes themes = Themes();
  @override
  void initState() {
    super.initState();
    selectedLanguage = box.read('selectedLanguage') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerlang = Get.find();
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
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(content: Text("double tap to exit")),
        child: Column(
          children: [
            ListTile(
              title: Text('Light'),
              onTap: () async {
                themes.changeTheme(false); // Change to light theme
                controllerlang.changeLang(selectedLanguage);
                setState(() {});
              },
            ),
            ListTile(
              title: Text('Dark'),
              onTap: () {
                themes.changeTheme(true); // Change to dark theme

                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
