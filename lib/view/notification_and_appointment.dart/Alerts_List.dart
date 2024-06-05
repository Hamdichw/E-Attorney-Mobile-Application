import 'package:estichara/utils/const.dart';
import 'package:estichara/utils/widgets/Reload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quickalert/quickalert.dart';

import '../../controller/notification_controller.dart';

/***************UI page demande rendez-vous **************************************** */
class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  final notificationController = Get.put(NotificationController());
  Future<void> _handlerefresh() async {
    await notificationController.GetRequest();
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

/*************get  données utilisateur *********************/
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
            /*********get list demande  rendez-vous  ************************/
            return FutureBuilder<List<dynamic>>(
              future: controller.GetRequest(),
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
                    /*******s'il n'y a pas des demande ********************* */
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
                  return LiquidPullToRefresh(
                    borderWidth: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : btncolor,
                    height: 150,
                    onRefresh: _handlerefresh,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var lawyer = snapshot.data![index]['lawyer'];
                        var lawyerName =
                            '${lawyer['firstName']} ${lawyer['lastName']}';
                        var lawyerEmail = lawyer['phoneNumber'] ?? '22-222-222';
                        var lawyerProfileImage = lawyer['profileImage'] ??
                            'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg';
                        var date = snapshot.data![index]['start'] ?? '';

                        // Parse the date string into a DateTime object
                        var dateTime = DateTime.parse(date);
                        // Format the date as "yyyy-MM-dd"
                        var formattedDate =
                            DateFormat('yyyy-MM-dd').format(dateTime);
                        // Format the time as "HH:mm"
                        var formattedTime =
                            DateFormat('HH:mm').format(dateTime);
                        return Dismissible(
                          //swipe pour supprimer le rendez-vous
                          key: Key(index.toString()),
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            QuickAlert.show(
                                disableBackBtn: true,
                                confirmBtnText: "Delete",
                                context: Get.context!,
                                title: 'Delete the request?',
                                type: QuickAlertType.warning,
                                onCancelBtnTap: () {
                                  setState(() {});
                                  Navigator.of(context).pop();
                                },
                                onConfirmBtnTap: () async {
                                  await controller.Delete(
                                      snapshot.data![index]['appointmentID']);
                                  setState(() {});
                                },
                                showCancelBtn: true);
                          },
                          direction: DismissDirection.endToStart,
                          child: ListTile(
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
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.delete_sweep_outlined,
                                    color: Colors.redAccent[700],
                                    size: 40,
                                  ),
                                )
                              ],
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
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
