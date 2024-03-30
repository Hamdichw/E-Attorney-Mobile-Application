import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

Widget buildFile(
  PlatformFile file,
  Function(int) onDelete,
  List<PlatformFile> files,
  ThemeData theme, // Add ThemeData parameter for theme configuration
) {
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
        color: theme.cardColor, // Use theme's card color
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.dividerColor, // Use theme's divider color
        ),
        boxShadow: [
          BoxShadow(
            color:
                theme.shadowColor.withOpacity(0.1), // Use theme's shadow color
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
            file.name!,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.headline6!
                    .color), // Use theme's text color for headline6
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            fileSize,
            style: TextStyle(
                fontSize: 16,
                color: theme.textTheme.bodyText2!
                    .color), // Use theme's text color for bodyText2
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.done_all,
                      color: theme.iconTheme.color), // Use theme's icon color
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.edit,
                      color: theme.iconTheme.color), // Use theme's icon color
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.share,
                      color: theme.iconTheme.color), // Use theme's icon color
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () => onDelete(files.indexOf(file)),
                  child: Icon(
                    Icons.delete,
                    color: Colors
                        .red, // This color is hard-coded. Adjust as needed.
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
