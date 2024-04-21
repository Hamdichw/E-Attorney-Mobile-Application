import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:estichara/locale/locale.dart';
import 'package:estichara/locale/locale_controller.dart';
import 'package:estichara/utils/dependency_injection.dart';
import 'package:estichara/utils/theme_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'view/first_screens/splash_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController()); // Initialize MyLocaleController
    return GetMaterialApp(
        translations: MyLocale(), // Your translations class
        locale: Locale(Get.find<MyLocaleController>()
            .selectedLanguage), // Set the initial locale
        fallbackLocale: Locale('en'), // Fallback locale
        debugShowCheckedModeBanner: false,
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: Themes().getThemeMode(),
        home: Scaffold(
          body: DoubleBackToCloseApp(
            child: SplashScreen(),
            snackBar: SnackBar(content: Text("double tap to exit")),
          ),
        ));
  }
}
