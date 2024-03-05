import 'package:estichara/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.blueGrey.shade300,
      appBarTheme: AppBarTheme(),
      dividerColor: Colors.black12);
  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.blue,
      appBarTheme: AppBarTheme(),
      dividerColor: Colors.white54);

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

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
