import 'package:estichara/utils/const.dart';
import 'package:estichara/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'const.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    textTheme: TextTheme(
        bodyLarge:
            TextStyle(color: btncolor), // Change text color for bodyText1
        bodyMedium: TextStyle(
            color: Colors.grey[700]), // Change text color for bodyText2
        displayLarge: TextStyle(color: Colors.black87)),
  );
  final darkTheme = ThemeData.dark().copyWith(
    textTheme: TextTheme(
        // Set text color for all text elements in dark theme
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.grey[700]),
        displayLarge: TextStyle(color: Colors.white)),
  );

  final getStorage = GetStorage();
  final darkThemeKey = 'isDarkTheme';
  void saveThemeData(bool isDarkMode) {
    getStorage.write(darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return getStorage.read(darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme(bool isDarkMode) {
    Get.changeTheme(isDarkMode ? darkTheme : lightTheme);
    saveThemeData(isDarkMode);
  }
}
/* 
class Themes {
  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    textTheme: TextTheme(
        // Set text color for all text elements in dark theme
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.grey[700]),
        displayLarge: TextStyle(color: Colors.white)),
  );
  static ThemeData customLightTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    textTheme: TextTheme(
        bodyLarge:
            TextStyle(color: btncolor), // Change text color for bodyText1
        bodyMedium: TextStyle(
            color: Colors.grey[700]), // Change text color for bodyText2
        displayLarge: TextStyle(color: Colors.black87)),
  );
} */
