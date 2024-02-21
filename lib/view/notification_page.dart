import 'package:e_attorney_hub/utils/const.dart';
import 'package:e_attorney_hub/utils/widgets/Card.dart';
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
              Row(
                children: [
                  const Image(
                      width: 70,
                      height: 70,
                      image: AssetImage("images/logo.png")),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.19,
                  ),
                  const Text(
                    "Notification",
                    style: TextStyle(
                        fontSize: 22,
                        color: btncolor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: newItem.length,
                itemBuilder: (context, index) {
                  return const Column(
                    children: [
                      card(
                        name: 'you have meeting tomorrow .  h1',
                        Icon: Icon(
                          Icons.circle,
                          size: 15,
                          color: btncolor,
                        ),
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
