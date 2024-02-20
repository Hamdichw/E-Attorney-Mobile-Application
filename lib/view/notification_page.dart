import 'package:e_attorney_hub/utils/const.dart';
import 'package:flutter/material.dart';
import '../utils/widgets/Notification_widget.dart';

class NotitcationTap extends StatelessWidget {
  NotitcationTap({Key? key}) : super(key: key);

  List<String> newItem = List.generate(5, (index) => "follow");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Image(
                      width: 70,
                      height: 70,
                      image: const AssetImage("images/logo.png")),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    "Notification",
                    style: TextStyle(
                        fontSize: 20,
                        color: btncolor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: newItem.length,
                itemBuilder: (context, index) {
                  return const Column(
                    children: [
                      CustomFollowNotifcation(
                        lawyer: 'dali',
                        msg: 'you have meeting tomorrow       .  h1',
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
