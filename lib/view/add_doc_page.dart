/* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/widgets/FilesPages.dart';

class Add_doc extends StatefulWidget {
  const Add_doc({super.key});

  @override
  State<Add_doc> createState() => _Add_docState();
}

class _Add_docState extends State<Add_doc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                FloatingActionButton(
                    onPressed: () async {
                      final result = await FilePicker.platform
                          .pickFiles(allowMultiple: true, type: FileType.any);
                      if (result == null) return;
                      //open single file
                      //final file = result.files.first;
                      //openFile(file);
                      openFiles(result.files);
                      //final newFile = await saveFilePermanently(file);
                      //print('From: ${file.path}');
                      //print('TO: ${newFile.path}');
                    },
                    child: Text("Choose fole")),
              ],
            ),
          )
        ],
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFilex.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void openFiles(List<PlatformFile> files) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilesPage(
                files: files,
                onOpenedFile: openFile,
              )));
}
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/widgets/GridView_Page.dart';

class AddDoc extends StatefulWidget {
  final List<PlatformFile> files;

  AddDoc({Key? key, required this.files}) : super(key: key);

  @override
  _AddDocState createState() => _AddDocState();
}

class _AddDocState extends State<AddDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 40,
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
                return buildFile(file);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: 130,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
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
                          " Add Docs",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.black,
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
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
}
