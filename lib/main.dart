import 'package:awesome_notifications/awesome_notifications.dart';
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
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          channelShowBadge: true,
        )
      ],
      debug: true);
  await GetStorage.init(); // Initialize GetStorage

  DependencyInjection.init(); // Initialize your dependencies
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    return GetMaterialApp(
        translations: MyLocale(),
        locale: Locale(Get.find<MyLocaleController>().selectedLanguage),
        fallbackLocale: Locale('en'), //Fallback locale
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
