import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../controller/list_lawyer_controller.dart';

import '../../utils/const.dart';
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
  Future<void> _handlerefresh() async {
    await controller.GetAllLawyer();
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  bool exist = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: LiquidPullToRefresh(
        borderWidth: 1,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : btncolor,
        height: 150,
        onRefresh: _handlerefresh,
        child: Padding(
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
                      return ReloadWidget(); // Placeholder for when data is loading
                    } else if (snapshot.hasError) {
                      // Placeholder for error state
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image(
                            image: AssetImage("assets/images/error.png"),
                            width: 300,
                            height: 300,
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
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      // Placeholder for when there's no data
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
                      // Manipulate or filter data before displaying
                      final List<dynamic> filteredData =
                          snapshot.data!.where((lawyer) {
                        // Filter based on your criteria, for example, filtering by 'Ville'
                        if (widget.Ville == 'All') {
                          return true; // Return true for all items if no specific filtering is needed
                        } else {
                          return lawyer['address'] == widget.Ville;
                        }
                      }).toList();
                      if (filteredData.length == 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image(
                              image: AssetImage("assets/images/nodata.png"),
                              width: 200,
                              height: 200,
                            ),
                            Center(
                              child: Text(
                                "No Lawyer in ${widget.Ville}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        );
                      }
                      return ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final data = filteredData[index];
                          return GestureDetector(
                            onTap: () {
                              // Show lawyer details
                              showModalBottomSheet(
                                barrierColor: Color.fromARGB(163, 0, 0, 0),
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? theme.colorScheme.background
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
                                // Display lawyer card
                                card(
                                  adrees: data['address'] ?? "no address",
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
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white.withOpacity(0.14)
                                      : Color.fromARGB(35, 0, 0, 0),
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
      ),
    );
  }
}
