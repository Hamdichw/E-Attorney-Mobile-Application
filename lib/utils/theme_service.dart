import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.light().textTheme),
  );
  final darkTheme = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.electrolizeTextTheme(ThemeData.dark().textTheme),
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
