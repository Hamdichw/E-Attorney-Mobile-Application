import 'package:estichara/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/chat/chat_page.dart';
import '../../view/details_page.dart';

class RecentChat extends StatefulWidget {
  const RecentChat({super.key});

  @override
  State<RecentChat> createState() => _RecentChatState();
}

class _RecentChatState extends State<RecentChat> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Messages",
                    style: GoogleFonts.electrolize(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          for (int i = 0; i < 10; i++)
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: InkWell(
                    onTap: () {
                      Get.to(Chat_Page());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onLongPress: () {
                                    showModalBottomSheet(
                                        scrollControlDisabledMaxHeightRatio:
                                            0.8,
                                        transitionAnimationController:
                                            AnimationController(
                                          vsync: this,
                                          duration: Duration(milliseconds: 400),
                                        ),
                                        showDragHandle: true,
                                        isScrollControlled: false,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20))),
                                        context: context,
                                        builder: (context) {
                                          return Details(
                                            images: "assets/images/test1.jpg",
                                            Name: "dali",
                                            Type: 'Lawyer',
                                            Lastname: "zaidi",
                                            Phone: "52381162",
                                          );
                                        });
                                  },
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.black54, width: 2),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.asset(
                                          "assets/images/test1.jpg",
                                          height: 65,
                                          width: 65,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dali Zaidi",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: btncolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "salam alaykom .....",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "00:00",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 23,
                                        width: 23,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: btncolor,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color.fromARGB(34, 0, 0, 0),
                ),
              ],
            )
        ],
      ),
    );
  }
}
