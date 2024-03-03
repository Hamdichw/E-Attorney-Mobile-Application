import 'package:estichara/utils/widgets/Dargable_list.dart';
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
    Lawyer(age: 47, name: 'seif', lastName: 'boubakrie', phone: '95687135'),
    Lawyer(age: 58, name: 'iskander', lastName: 'channouf', phone: '25951412'),
    Lawyer(age: 78, name: 'hamdi', lastName: 'chtiwi', phone: '22449174'),
    Lawyer(age: 44, name: 'saif', lastName: 'klai', phone: '26351837'),
    Lawyer(age: 51, name: 'saif', lastName: 'Dabssi', phone: '25915880'),
    Lawyer(age: 66, name: 'baha', lastName: 'Laamiri', phone: '26485618'),
    Lawyer(age: 66, name: 'Denzel', lastName: 'Washington'),
    Lawyer(age: 66, name: 'Denzel', lastName: 'Washington'),
    Lawyer(age: 49, name: 'Ben', lastName: 'Affleck'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /*  Padding(
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
              ), */
            const SizedBox(
              height: 15,
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
                              Name: data[index].name,
                              Type: 'Lawyer',
                              Lastname: data[index].lastName,
                              Phone: data[index].phone,
                            );
                          });
                      /*  navigation(
                          context,
                          Details(
                            Name: data[index].name,
                            Type: 'Lawyer',
                            Lastname: data[index].lastName,
                            Phone: data[index].phone,
                          )); */
                    },
                    child: Column(
                      children: [
                        card(
                          name: data[index].name,
                          Lastname: data[index].lastName,
                          image: Image(
                            image: AssetImage("assets/images/images.jpg"),
                            height: 65,
                            width: 65,
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
