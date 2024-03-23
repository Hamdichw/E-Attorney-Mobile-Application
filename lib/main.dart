import 'package:estichara/utils/theme_service.dart';
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
import 'view/splash_screen.dart';

void main() async {
  //await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
