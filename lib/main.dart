import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

import 'utils/const.dart';
import 'utils/widgets/Alerts_List.dart';
import 'view/add_doc_page.dart';
import 'view/chat/chat.dart';
import 'view/details_page.dart';
import 'view/nav_bar.dart';
import 'view/notification_page.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
