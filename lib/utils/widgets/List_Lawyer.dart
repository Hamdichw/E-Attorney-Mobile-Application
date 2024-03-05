import 'package:estichara/view/chat/chat.dart';
import 'package:get/get.dart';

import '/models/lawyers.dart';
import '/utils/function.dart';
import '/view/details_page.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import 'Cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<Lawyer> data = [
    Lawyer(
        age: 47,
        name: 'seif',
        lastName: 'boubakrie',
        phone: '95687135',
        image: 'assets/images/test1.jpg',
        valide: true),
    Lawyer(
        age: 58,
        name: 'iskander',
        lastName: 'channouf',
        phone: '25951412',
        image: 'assets/images/test2.jpg',
        valide: true),
    Lawyer(
        age: 78,
        name: 'hamdi',
        lastName: 'chtiwi',
        phone: '22449174',
        image: 'assets/images/test3.jpg'),
    Lawyer(
        age: 44,
        name: 'saif',
        lastName: 'klai',
        phone: '26351837',
        image: 'assets/images/avatar.png',
        valide: true),
    Lawyer(
        age: 51,
        name: 'saif',
        lastName: 'Dabssi',
        phone: '25915880',
        image: 'assets/images/test1.jpg'),
    Lawyer(
        age: 66,
        name: 'baha',
        lastName: 'Laamiri',
        phone: '26485618',
        image: 'assets/images/test2.jpg',
        valide: true),
    Lawyer(
        age: 66,
        name: 'Denzel',
        lastName: 'Washington',
        image: 'assets/images/test3.jpg'),
    Lawyer(
        age: 66,
        name: 'Denzel',
        lastName: 'Washington',
        image: 'assets/images/test4.jpg'),
    Lawyer(
        age: 49,
        name: 'Ben',
        lastName: 'Affleck',
        image: 'assets/images/images.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          barrierColor: Color.fromARGB(163, 0, 0, 0),
                          backgroundColor: Color.fromARGB(202, 255, 255, 255),
                          scrollControlDisabledMaxHeightRatio: 0.75,
                          transitionAnimationController: AnimationController(
                            vsync: this,
                            duration: Duration(milliseconds: 450),
                          ),
                          showDragHandle: true,
                          isScrollControlled: false,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          context: context,
                          builder: (context) {
                            return Details(
                              images: data[index].image,
                              Name: data[index].name,
                              Type: 'Lawyer',
                              Lastname: data[index].lastName,
                              Phone: data[index].phone,
                              valide: data[index].valide,
                            );
                          });
                    },
                    child: Column(
                      children: [
                        card(
                          valide: data[index].valide,
                          name: data[index].name,
                          Lastname: data[index].lastName,
                          image: Image(
                            image: AssetImage(data[index].image),
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Color.fromARGB(35, 0, 0, 0),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
