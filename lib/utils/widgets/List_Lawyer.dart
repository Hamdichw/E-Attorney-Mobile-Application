import 'package:estichara/view/chat/chat.dart';
import 'package:get/get.dart';

import '../../controller/list_lawyer_controller.dart';
import '../../model/lawyers.dart';
import '/utils/function.dart';
import '/view/details_page.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import 'Cards.dart';

import 'package:g_skeleton/g_skeleton.dart';

import 'Filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List_Lawyer_Controller controller = Get.put(List_Lawyer_Controller());
  final controllr = SkeletonController();
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
              child: FutureBuilder<List<dynamic>>(
                future: controller.GetAllLawyer(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ReloadWidget();
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.data == null) {
                    return Center(child: Text('No data available'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              barrierColor: Color.fromARGB(163, 0, 0, 0),
                              backgroundColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? theme.colorScheme
                                      .background // White color with 14% opacity
                                  : Color.fromARGB(202, 255, 255, 255),
                              scrollControlDisabledMaxHeightRatio: 0.75,
                              transitionAnimationController:
                                  AnimationController(
                                vsync: this,
                                duration: Duration(milliseconds: 450),
                              ),
                              showDragHandle: true,
                              isScrollControlled: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return Details(
                                  id: data['userID'],
                                  images: data['profileImage'] ??
                                      'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
                                  Name: data['firstName'] ?? '',
                                  Type: 'Lawyer',
                                  Lastname: data['lastName'] ?? '',
                                  Phone: data['phoneNumber'] ?? '',
                                  valide: data['valide'] ?? false,
                                  email: data['email'] ?? '',
                                  bio: data['bio'] ?? '',
                                  adress: data['address'] ?? '',
                                  userid: controller.userDataList![7],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              card(
                                valide: data['valide'] ?? false,
                                name: data['firstName'] ?? '',
                                Lastname: data['lastName'] ?? '',
                                image: Image.network(
                                  data['profileImage'] ??
                                      'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
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
                                    : Color.fromARGB(
                                        35, 0, 0, 0), // Default color
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
