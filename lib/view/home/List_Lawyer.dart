import 'package:get/get.dart';

import '../../controller/list_lawyer_controller.dart';

import 'details_page.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/Cards.dart';

import 'package:g_skeleton/g_skeleton.dart';

import '../../utils/widgets/Reload_page.dart';

class HomePage extends StatefulWidget {
  final String Ville;
  const HomePage({
    Key? key,
    required this.Ville,
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image(
                          image: AssetImage("assets/images/error.png"),
                          width: 200,
                          height: 200,
                        ),
                        Center(
                          child: Text(
                            "Error",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.data == null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/nodata.png"),
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "No Data",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data;
                        if (widget.Ville == 'All') {
                          data = snapshot.data![index];
                        } else if (snapshot.data![index]['address'] ==
                            widget.Ville) {
                          data = snapshot.data![index];
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.25),
                              Image(
                                image: AssetImage("assets/images/nodata.png"),
                                width: 200,
                                height: 200,
                              ),
                              Text(
                                "No Lawyer in ${widget.Ville}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          );
                        }

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
                                  Phone: data['phoneNumber'] ?? '    N/A',
                                  valide: data['valide'] ?? false,
                                  email: data['email'] ?? '',
                                  bio: data['bio'] ??
                                      'There is no information about this lawyer',
                                  adress: data['address'] ?? '    N/A',
                                  userid: controller.userDataList![7],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              card(
                                adrees: data['address'] ?? "no adress",
                                valide: data['valide'] ?? true,
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
