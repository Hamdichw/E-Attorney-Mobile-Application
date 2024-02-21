import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../utils/widgets/List_Lawyer.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Row(
            children: [
              Image(
                  width: 70, height: 70, image: AssetImage("images/logo.png")),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.19,
              ),
              Text(
                "Find a Lawyer",
                style: TextStyle(
                    color: btncolor, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(child: HomePage()),
        ]),
      ),
    );
  }
}
