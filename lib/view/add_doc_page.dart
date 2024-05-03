import 'package:estichara/utils/function.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../controller/chat_controller.dart';
import '../controller/document_controller.dart';
import '../utils/const.dart';

class AddDoc extends StatefulWidget {
  @override
  State<AddDoc> createState() => _AddDocState();
}

class _AddDocState extends State<AddDoc> {
  final Document_Add controller = Get.put(Document_Add());

  final Chat_Controller controller1 = Get.put(Chat_Controller());

  Future<void> _handlerefresh() async {
    await controller.getDocument();
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Application_Name(),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: controller
                    .getDocument(), // Assuming getDocuments() returns Future<List<Map<String, dynamic>>>
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: btncolor,
                      ),
                    );
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
                  } else if (snapshot.hasData &&
                      (snapshot.data == null || snapshot.data!.isEmpty)) {
                    return Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25),
                        Image(
                          image: AssetImage("assets/images/nodata.png"),
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "No Files",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Text(
                                "25".tr,
                                style: TextStyle(
                                  color: theme.textTheme.displayLarge!.color,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Container(
                                            width: double.maxFinite,
                                            height: 300,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.policy_outlined,
                                                        color:
                                                            Color(0xFF0096FF),
                                                        size: 40,
                                                      ),
                                                      Text(
                                                        ": To check if the doc is signed",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .workspace_premium_outlined,
                                                        color:
                                                            Color(0xFFBFA100),
                                                        size: 40,
                                                      ),
                                                      Text(
                                                        ": To Sign  the doc ",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.share,
                                                        size: 40,
                                                      ),
                                                      Text(
                                                        ": To share the doc with your lawyers ",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delete,
                                                        size: 40,
                                                        color: Colors.red,
                                                      ),
                                                      Text(
                                                        ": To Delete The Doc selected ",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .file_open_outlined,
                                                        size: 40,
                                                      ),
                                                      Text(
                                                        ": click to open the doc ",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.help_outline_rounded,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: LiquidPullToRefresh(
                            borderWidth: 1,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : btncolor,
                            height: 150,
                            onRefresh: _handlerefresh,
                            child: GridView.builder(
                              padding: EdgeInsets.all(16),
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                              itemBuilder: (context, index) {
                                final file = snapshot.data![index];
                                return buildFile(
                                  file,
                                  theme,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 160,
                  child: FloatingActionButton(
                    backgroundColor: btncolor,
                    elevation: 5,
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      if (result == null || result.files.isEmpty) return;
                      final PlatformFile file = result.files.first;
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: btncolor,
                            ),
                          );
                        },
                      );
                      await controller.AddDocument(
                          file, 'title', 'description');
                      Navigator.pop(context);
                      print('done');
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "21".tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFile(
    Map<String, dynamic>? files,
    ThemeData theme,
  ) {
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
                        await controller.VerifSign(files['documentID'],
                            files['uploadedBy']['username']);
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          child: DecoratedBox(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  color: theme
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .color!,
                                                                  width: 2),
                                                            ),
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            35),
                                                                child: Image
                                                                    .network(
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
                                                            onPressed:
                                                                () async {
                                                              await controller
                                                                  .ShareDocument(
                                                                      files[
                                                                          'documentID'],
                                                                      data[
                                                                          'email']);
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .send_rounded,
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
                        await controller.VerifSign(files['documentID'],
                            files['uploadedBy']['username']);
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
}
