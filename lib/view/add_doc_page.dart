import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../controller/chat_controller.dart';
import '../controller/document_controller.dart';
import '../utils/const.dart';
import '../utils/widgets/doc_help_info.dart';
import '../utils/widgets/document_view.dart';

class AddDoc extends StatefulWidget {
  @override
  State<AddDoc> createState() => _AddDocState();
}

class _AddDocState extends State<AddDoc> {
  /******appel controller***** */
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
            //*******affichage de document with grid view **************/
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: controller.getDocument(),
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
                              info_doc_page()
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
            /*******button add document**** */
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
}
