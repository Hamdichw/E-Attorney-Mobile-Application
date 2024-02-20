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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const Row(
          children: [
            Image(width: 70, height: 70, image: AssetImage("images/logo.png")),
            SizedBox(
              width: 60,
            ),
            Text(
              "Find a Lawyer",
              style: TextStyle(
                  color: btncolor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Expanded(child: HomePage()),
      ]),
    );
  }
}
