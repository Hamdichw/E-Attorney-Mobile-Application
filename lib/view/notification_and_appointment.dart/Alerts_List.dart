import 'package:estichara/utils/const.dart';
import 'package:estichara/utils/widgets/Reload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/notification_controller.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
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
              future: controller.GetRequest(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ReloadWidget();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.data!.length == 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(
                        image: AssetImage("assets/images/nodata.png"),
                        width: 200,
                        height: 200,
                      ),
                      Center(
                        child: Text(
                          "No Appointement",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var lawyer = snapshot.data![index]['lawyer'];
                      var lawyerName =
                          '${lawyer['firstName']} ${lawyer['lastName']}';
                      var lawyerEmail = lawyer['phoneNumber'] ?? '22-222-222';
                      var lawyerProfileImage = lawyer['profileImage'] ?? '';
                      var date = snapshot.data![index]['start'] ?? '';

                      // Parse the date string into a DateTime object
                      var dateTime = DateTime.parse(date);

                      // Format the date as "yyyy-MM-dd"
                      var formattedDate =
                          DateFormat('yyyy-MM-dd').format(dateTime);
                      // Format the time as "HH:mm"
                      var formattedTime = DateFormat('HH:mm').format(dateTime);

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(lawyerProfileImage),
                        ),
                        title: Text(lawyerName),
                        subtitle: Text(lawyerEmail),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$formattedDate \n$formattedTime',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: btncolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.alarm,
                                color: Colors.purple[700],
                                size: 30,
                              ),
                            )
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