import 'package:flutter/material.dart';

import '../const.dart';

class ActiveChat extends StatelessWidget {
  const ActiveChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 3))
                        ]),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset("assets/images/images.jpg")),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: btncolor),
                            child: Icon(Icons.circle,
                                color: Color.fromARGB(255, 96, 202, 100),
                                size: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "dali",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            )
        ]),
      ),
    );
  }
}
