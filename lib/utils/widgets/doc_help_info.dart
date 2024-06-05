import 'package:flutter/material.dart';

class info_doc_page extends StatelessWidget {
  const info_doc_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.policy_outlined,
                              color: Color(0xFF0096FF),
                              size: 40,
                            ),
                            Text(
                              ": To check if the doc is signed",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.workspace_premium_outlined,
                              color: Color(0xFFBFA100),
                              size: 40,
                            ),
                            Text(
                              ": To Sign  the doc ",
                              style: TextStyle(fontSize: 16),
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
                              style: TextStyle(fontSize: 15),
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
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.file_open_outlined,
                              size: 40,
                            ),
                            Text(
                              ": click to open the doc ",
                              style: TextStyle(fontSize: 16),
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
        ));
  }
}
