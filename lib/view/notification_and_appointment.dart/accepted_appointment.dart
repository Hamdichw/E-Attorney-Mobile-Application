import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/notification_controller.dart';
import '../../utils/const.dart';
import '../../utils/widgets/Reload_page.dart';

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
                  return ReloadWidget();
                } else if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(
                        image: AssetImage("assets/images/error.png"),
                        width: 300,
                        height: 300,
                      ),
                      Center(
                        child: Text(
                          "Error",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  );
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
                      var lawyerEmail = lawyer['phoneNumber'] ?? '';
                      var lawyerProfileImage = lawyer['profileImage'] ??
                          'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg';

                      // Parse the datetime string into a DateTime object
                      var date = snapshot.data![index]['start'] ?? '';

                      // Parse the date string into a DateTime object
                      var dateTime = DateTime.parse(date as String);

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
                            SizedBox(width: 8),
                            Icon(
                              Icons.done,
                              color: Colors.green[400],
                              size: 30,
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
