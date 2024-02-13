import 'package:flutter/material.dart';
import '../utils/widgets/custom_follow_notifcation.dart';
import '../utils/widgets/custom_liked_notifcation.dart';

class NotitcationTap extends StatelessWidget {
  NotitcationTap({Key? key}) : super(key: key);

  List<String> newItem = List.generate(16, (index) => "follow");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: newItem.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomFollowNotifcation(
                          lawyer: 'dali',
                          msg: 'New following you  .  h1',
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
      ),
    );
  }
}
