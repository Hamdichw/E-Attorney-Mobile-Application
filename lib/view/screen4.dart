import 'package:e_attorney_hub/utils/const.dart';
import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      color: btncolor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("We're happy to see you here.")),
            Image(
                height: 400,
                width: 10,
                image: AssetImage('images/mobile_login.png')),
          ],
        ),
      ),
    );
  }
}
