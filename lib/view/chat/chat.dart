import 'package:estichara/utils/const.dart';
import 'package:flutter/material.dart';

import 'Recent_chat.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

bool show = false;

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Application_Name(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: RecentChat())
          ],
        ),
      ),
    );
  }
}
