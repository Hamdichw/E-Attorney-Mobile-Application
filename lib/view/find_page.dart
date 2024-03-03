import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../utils/widgets/List_Lawyer.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Row(
            children: [
              Image(
                  width: 70,
                  height: 70,
                  image: AssetImage("assets/images/logo.png")),
              Text(
                "Estishara.tn",
                style: TextStyle(
                    color: btncolor,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  )),
            ],
          ),
          if (show)
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 5, right: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 216, 216, 216),
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
          Expanded(child: HomePage()),
        ]),
      ),
    );
  }
}
