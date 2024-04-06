import 'package:estichara/utils/widgets/Alerts_List.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
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
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
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
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "14".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: click
                                ? Colors.blueAccent
                                : theme.textTheme.displayLarge!.color,
                          ),
                        )),
                        Spacer(),
                        if (click)
                          Divider(
                            height: 1,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Colors.white.withOpacity(
                                    0.6) // White color with 14% opacity
                                : Color.fromARGB(157, 0, 0, 0), // Default color
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
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "15".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: click1
                                ? Colors.blueAccent
                                : theme.textTheme.displayLarge!.color,
                          ),
                        )),
                        Spacer(),
                        if (click1)
                          Divider(
                            height: 1,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Colors.white.withOpacity(
                                    0.6) // White color with 14% opacity
                                : Color.fromARGB(157, 0, 0, 0), // Default color
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
