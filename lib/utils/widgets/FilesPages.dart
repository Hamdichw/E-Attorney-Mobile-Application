import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilesPage extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FilesPage({super.key, required this.files, required this.onOpenedFile});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("file"),
      ),
      body: Center(
          child: GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: widget.files.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemBuilder: (context, index) {
                final file = widget.files[index];
                return buildFile(file);
              })),
    );
  }

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)}MB';
    final extension = file.extension ?? 'none';
    return InkWell(
      onTap: () => widget.onOpenedFile(file),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '.$extension',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Text(
              file.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              fileSize,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
