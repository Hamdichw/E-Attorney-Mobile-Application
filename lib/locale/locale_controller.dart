import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyLocaleController extends GetxController {
  final box = GetStorage();

  // Key for storing the selected language code
  static const _selectedLanguageKey = 'selectedLanguage';

  // Getter to retrieve the selected language code
  String get selectedLanguage =>
      box.read(_selectedLanguageKey) ??
      'en'; // Default to English if no language is set

  // Setter to change the language and save the new language code
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);

    // Save the selected language code
    box.write(_selectedLanguageKey, codeLang);
  }
}
