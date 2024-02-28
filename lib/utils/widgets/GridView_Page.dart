import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

Widget buildFile(
    PlatformFile file, Function(int) onDelete, List<PlatformFile> files) {
  final kb = file.size! / 1024;
  final mb = kb / 1024;
  final fileSize =
      mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)}MB';
  final extension = file.extension ?? 'none';
  return InkWell(
    onTap: () async {
      final appDir = await getApplicationDocumentsDirectory();
      final filePath = '${appDir.path}/${file.name}';
      openFile(filePath);
      await File(filePath).writeAsBytes(file.bytes!);
    },
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color.fromARGB(0, 158, 158, 158),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(146, 0, 0, 0)
                  .withOpacity(0.3), // Set the shadow color
              spreadRadius: 3, // Set the spread radius of the shadow
              blurRadius: 7, // Set the blur radius of the shadow
              offset: Offset(0, 3), // Set the offset of the shadow
            ),
          ]),
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
                )),
          ),
          SizedBox(height: 8),
          Text(
            file.name!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            fileSize,
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child:
                    GestureDetector(onTap: () {}, child: Icon(Icons.done_all)),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(onTap: () {}, child: Icon(Icons.edit)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(onTap: () {}, child: Icon(Icons.share)),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () => onDelete(files.indexOf(file)),
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

openFile(String filePath) {
  OpenFilex.open(filePath);
}
