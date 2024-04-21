import 'package:estichara/utils/const.dart';
import 'package:estichara/utils/widgets/SearshField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Row(
              children: [
                Image(
                    width: 70,
                    height: 70,
                    image: AssetImage("assets/images/logo.png")),
                Text(
                  "Estishara.tn",
                  style: GoogleFonts.electrolize(
                      textStyle: TextStyle(
                          color: btncolor,
                          fontSize: 24,
                          fontWeight: FontWeight.normal)),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    )),
              ],
            ),
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
