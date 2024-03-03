import 'package:estichara/view/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/chat/chat_page.dart';
import '../const.dart';

class ActiveChat extends StatelessWidget {
  const ActiveChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "online",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, left: 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (int i = 0; i < 10; i++)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0, 3))
                            ]),
                        child: GestureDetector(
                          onLongPress: () {
                            Get.to(Details(
                              Name: "Name",
                              Lastname: "Lastname",
                              Type: "Type",
                              Phone: "22-222-222",
                            ));
                          },
                          onTap: () {
                            Get.to(Chat_Page());
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child:
                                      Image.asset("assets/images/images.jpg")),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: btncolor),
                                  child: Icon(Icons.circle,
                                      color: Color.fromARGB(255, 96, 202, 100),
                                      size: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "dali",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
            ]),
          ),
        ),
      ],
    );
  }
}
