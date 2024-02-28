import 'package:estichara/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/chat_page.dart';

class RecentChat extends StatelessWidget {
  const RecentChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 2))
          ]),
      child: Column(
        children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: InkWell(
                onTap: () {
                  Get.to(Chat_Page());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: 65,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset(
                            "assets/images/images.jpg",
                            height: 65,
                            width: 65,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                "Dali Zaidi",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: btncolor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "salam alaykom .....",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "00:00",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black54),
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
                                    borderRadius: BorderRadius.circular(25)),
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
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
