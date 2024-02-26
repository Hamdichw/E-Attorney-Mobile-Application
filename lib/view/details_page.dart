import '/utils/const.dart';
import 'package:flutter/material.dart';

import '../utils/widgets/Cards.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background_color,
      appBar: AppBar(
        backgroundColor: Background_color,
        title: const Text(
          "View Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: btncolor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Card1(),
              Container(height: 20),
              Card4(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Card2(),
                    ),
                    Container(width: 2),
                    const Expanded(
                      flex: 1,
                      child: Card3(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
