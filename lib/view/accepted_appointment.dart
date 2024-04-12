import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/notification_controller.dart';

class AcceptedApp extends StatefulWidget {
  const AcceptedApp({Key? key}) : super(key: key);

  @override
  State<AcceptedApp> createState() => _AcceptedAppState();
}

class _AcceptedAppState extends State<AcceptedApp> {
  final notificationController = Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    notificationController.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          if (controller.userDataList == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return FutureBuilder<List<dynamic>>(
              future: controller.GetAccept(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var lawyer = snapshot.data![index]['lawyer'];
                      var lawyerName =
                          '${lawyer['firstName']} ${lawyer['lastName']}';
                      var lawyerEmail = lawyer['email'] ?? '';
                      var lawyerProfileImage = lawyer['profileImage'] ?? '';

                      // Parse the datetime string into a DateTime object
                      var startDateTime = DateTime.parse(snapshot.data![index]
                              ['start'] ??
                          '2024-04-12T14:00:00.000+00:00');

                      // Format the datetime to display only day and month
                      var formattedDate =
                          DateFormat('dd MMM').format(startDateTime);

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(lawyerProfileImage),
                        ),
                        title: Text(lawyerName),
                        subtitle: Text(lawyerEmail),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("$formattedDate"),
                            SizedBox(width: 8),
                            Icon(
                              Icons.done,
                              color: Colors.green[400],
                            ),
                          ],
                        ),
                        onTap: () {
                          // Add any action you want to perform when ListTile is tapped
                        },
                      );
                    },
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
