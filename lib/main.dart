import 'package:estichara/locale/locale.dart';
import 'package:estichara/locale/locale_controller.dart';
import 'package:estichara/utils/dependency_injection.dart';
import 'package:estichara/utils/theme_service.dart';
import 'package:estichara/view/find_page.dart';
import 'package:estichara/view/first_screens/page_controller.dart';
import 'package:estichara/view/first_screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/const.dart';
import 'utils/widgets/Alerts_List.dart';
import 'view/add_doc_page.dart';
import 'view/chat/chat.dart';
import 'view/details_page.dart';
import 'view/nav_bar.dart';
import 'view/notification_page.dart';
import 'view/profile_screen.dart';
import 'view/splash_screen.dart';
import 'view/verification.dart';

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
      home: SplashScreen(),
    );
  }
}
