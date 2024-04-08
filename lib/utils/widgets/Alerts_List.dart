import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/notification_controller.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  final notificationController =
      Get.put(NotificationController()); // Initialize NotificationController

  @override
  void initState() {
    super.initState();
    // Fetch user data when the widget initializes
    notificationController.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          if (controller.userDataList == null) {
            // If user data is still loading, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else {
            // Once user data is loaded, build FutureBuilder to display fetched data
            return FutureBuilder<List<dynamic>>(
              future: controller.GetRequest(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  // Create a list of Text widgets to display all items
                  List<Widget> texts = [];
                  for (var i = 0; i < snapshot.data!.length; i++) {
                    texts.add(Text(snapshot.data![i].toString()));
                  }
                  // Return a column containing all Text widgets
                  return Column(
                    children: texts,
                  );
                }
              }),
            );
          }
        },
      ),
    );
  }
}
