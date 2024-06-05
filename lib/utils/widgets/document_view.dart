import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/chat_controller.dart';
import '../../controller/document_controller.dart';
import '../function.dart';

Widget buildFile(
  Map<String, dynamic>? files,
  ThemeData theme,
) {
  final Document_Add controller = Get.put(Document_Add());
  final Chat_Controller controller1 = Get.put(Chat_Controller());
  if (files == null) {
    return Container();
  }

  return InkWell(
    onTap: () async {
      await controller.DownloadDoc(files['documentID'], files['title']);
    },
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.dividerColor,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                "assets/images/docview.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            files['title'] ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.headline6!.color,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            files['description'] ?? '',
            style: TextStyle(
              fontSize: 16,
              color: theme.textTheme.bodyText2!.color,
            ),
          ),
          Row(
            children: [
              if (files['uploadedBy']['username'] ==
                  controller.userDataList![2]) ...[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () async {
                      await controller.VerifSign(
                          files['documentID'], files['uploadedBy']['username']);
                    },
                    child:
                        Icon(Icons.policy_outlined, color: Color(0xFF0096FF)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () async {
                      await controller.SignDoc(files['documentID']);
                    },
                    child: Icon(Icons.workspace_premium_outlined,
                        color: Color(0xFFBFA100)),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: Get.context!,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titleTextStyle: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white.withOpacity(
                                        0.6) // White color with 14% opacity
                                    : Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20),
                            title: Center(child: Text('Choose Your Lawyer')),
                            content: Container(
                                width: double.maxFinite,
                                height: 300,
                                child: FutureBuilder(
                                    future: controller1.GetAllChat(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Container();
                                      } else if (!snapshot.hasData) {
                                        return Container();
                                      } else {
                                        return ListView.builder(
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              var data = snapshot.data![index]
                                                  ['firstUser'];
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        child: DecoratedBox(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: theme
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .color!,
                                                                width: 2),
                                                          ),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    3),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          35),
                                                              child:
                                                                  Image.network(
                                                                data['profileImage'] ??
                                                                    'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
                                                                height: 55,
                                                                width: 55,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        "${data['firstName']} ${data['lastName']}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: theme
                                                                .textTheme
                                                                .bodyText1!
                                                                .color,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Spacer(),
                                                      IconButton(
                                                          onPressed: () async {
                                                            await controller
                                                                .ShareDocument(
                                                                    files[
                                                                        'documentID'],
                                                                    data[
                                                                        'email']);
                                                          },
                                                          icon: Icon(
                                                            Icons.send_rounded,
                                                            size: 30,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      }
                                    })),
                          );
                        },
                      );
                    },
                    child: Icon(Icons.share, color: theme.iconTheme.color),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () async =>
                        await controller.DeleteDoc(files['documentID']),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
              if (files['uploadedBy']['username'] !=
                  controller.userDataList![2]) ...[
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: theme.textTheme.bodyMedium!.color!,
                            width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.network(
                          files['uploadedBy']['profileImage'] ??
                              'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(truncateMot1("${files['uploadedByUserName']}")),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () async {
                      await controller.VerifSign(
                          files['documentID'], files['uploadedBy']['username']);
                    },
                    child:
                        Icon(Icons.policy_outlined, color: Color(0xFF0096FF)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () async =>
                        await controller.DeleteDoc(files['documentID']),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ],
          )
        ],
      ),
    ),
  );
}
