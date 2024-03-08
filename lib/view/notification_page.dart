import 'package:estichara/utils/widgets/Alerts_List.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/const.dart';
import '/utils/widgets/Cards.dart';
import 'package:flutter/material.dart';

class NotitcationTap extends StatefulWidget {
  NotitcationTap({Key? key}) : super(key: key);

  @override
  State<NotitcationTap> createState() => _NotitcationTapState();
}

class _NotitcationTapState extends State<NotitcationTap> {
  List<String> newItem = List.generate(20, (index) => "follow");

  bool click = true;

  bool click1 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Application_Name(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      click = true;
                      click1 = false;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "Alerts",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: click ? Colors.blueAccent : Colors.black,
                          ),
                        )),
                        Spacer(),
                        if (click)
                          Divider(
                            height: 1,
                            color: Color.fromARGB(157, 0, 0, 0),
                          )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      click = false;
                      click1 = true;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "meets",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: click1 ? Colors.blueAccent : Colors.black,
                          ),
                        )),
                        Spacer(),
                        if (click1)
                          Divider(
                            height: 1,
                            color: Color.fromARGB(157, 0, 0, 0),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
            if (click)
              Expanded(child: Alerts())
            else
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.105,
                      ),
                      Image.asset("assets/images/nodata.png"),
                      Text(
                        "No Meets",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
