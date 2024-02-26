import '/utils/const.dart';
import '/utils/widgets/Cards.dart';
import 'package:flutter/material.dart';

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
                      image: AssetImage("assets/images/logo.png")),
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
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Divider(
                height: 1,
                color: Color.fromARGB(157, 0, 0, 0),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: newItem.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      card_notifcation(
                        msg: 'you have meeting tomorrow ',
                        icon: Icon(
                          Icons.circle,
                          size: 10,
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
