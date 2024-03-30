import 'package:estichara/view/chat/chat.dart';
import 'package:get/get.dart';

import '../../model/lawyers.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
                          color: theme.brightness == Brightness.dark
                              ? Colors.white.withOpacity(
                                  0.14) // White color with 14% opacity
                              : Color.fromARGB(35, 0, 0, 0), // Default color
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
