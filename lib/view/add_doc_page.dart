import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../controller/document_controller.dart';
import '../utils/const.dart';
import '../utils/widgets/GridView_Page.dart';

/* 
class AddDoc extends StatefulWidget {
  final List<PlatformFile> files;

  AddDoc({Key? key, required this.files}) : super(key: key);

  @override
  _AddDocState createState() => _AddDocState();
}

class _AddDocState extends State<AddDoc> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Application_Name(),
            SizedBox(
              height: 30,
            ),
            if (widget.files.isEmpty)
              Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Image(
                  image: AssetImage("assets/images/nodata.png"),
                  width: 200,
                  height: 200,
                ),
                Text(
                  "No Files",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ]),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: widget.files.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final file = widget.files[index];
                  return buildFile(
                      file,
                      (int index) => setState(() =>
                          widget.files.removeAt(index)), // onDelete function
                      widget.files,
                      theme);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 140,
                  child: FloatingActionButton(
                    backgroundColor: btncolor,
                    elevation: 5,
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.custom,
                          allowedExtensions: ['pdf']);
                      if (result == null) return;
                      setState(() {
                        widget.files.addAll(result.files);
                      });
                      for (PlatformFile file in widget.files) {
                        saveFilePermanently(file);
                      }
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
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
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

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
}
 */
// Import your GetX controller
class AddDoc extends StatelessWidget {
  final Document_Add controller = Get.put(Document_Add());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Application_Name(),
            SizedBox(height: 30),
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
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
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
                    return GridView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      onTap: () async {},
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
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.done_all, color: theme.iconTheme.color),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.edit, color: theme.iconTheme.color),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
