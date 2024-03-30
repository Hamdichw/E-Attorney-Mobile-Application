import 'package:estichara/locale/locale_controller.dart';
import 'package:estichara/view/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String selectedLanguage = '';
  final box = GetStorage();

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
        title: Text("Language"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(NavBar(
              indx: 4,
            ));
          },
        ),
      ),
      body: Column(children: [
        ListTile(
          title: Text("1".tr),
          trailing: selectedLanguage == "ar" ? Icon(Icons.done) : null,
          onTap: () {
            setState(() {
              selectedLanguage = "ar";
            });
            controllerlang.changeLang("ar");
            box.write('selectedLanguage', 'ar');
          },
        ),
        ListTile(
          title: Text("2".tr),
          trailing: selectedLanguage == "en" ? Icon(Icons.done) : null,
          onTap: () {
            setState(() {
              selectedLanguage = "en";
            });
            controllerlang.changeLang("en");
            box.write('selectedLanguage', 'en');
          },
        ),
        ListTile(
          title: Text("3".tr),
          trailing: selectedLanguage == "fr" ? Icon(Icons.done) : null,
          onTap: () {
            setState(() {
              selectedLanguage = "fr";
            });
            controllerlang.changeLang("fr");
            box.write('selectedLanguage', 'fr');
          },
        )
      ]),
    );
  }
}
