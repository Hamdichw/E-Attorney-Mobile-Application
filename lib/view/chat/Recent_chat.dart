import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controller/chat_controller.dart';
import '../../utils/function.dart';
import 'chat_page.dart';

import '../../utils/widgets/Reload_page.dart';

class RecentChat extends StatelessWidget {
  RecentChat({Key? key}) : super(key: key);
  final Chat_Controller controller = Get.put(Chat_Controller());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "20".tr,
                      style: GoogleFonts.electrolize(
                          textStyle: TextStyle(
                              color: theme.textTheme.displayLarge!.color,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: FutureBuilder<List<dynamic>>(
                future: controller.GetAllChat(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ReloadWidget();
                  } else if (snapshot.hasError) {
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
                          "No Messages",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                          "No Messages",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data![index]['firstUser'];
                        // Fetch last message
                        return FutureBuilder<Map<String, dynamic>?>(
                          future: controller.fetchLastMessage(
                              snapshot.data![index]['chatId']),
                          builder: (context, messageSnapshot) {
                            if (messageSnapshot.hasError) {
                              // If there's an error fetching the message
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image:
                                        AssetImage("assets/images/nodata.png"),
                                    width: 200,
                                    height: 200,
                                  ),
                                  Text(
                                    "No Messages",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              );
                            } else {
                              // If message fetched successfully
                              var lastMessage = messageSnapshot.data;
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(Chat_Page(
                                          chatid: snapshot.data![index]
                                              ['chatId'],
                                          username: controller.userDataList![2],
                                          lawyername:
                                              "${data['firstName']} ${data['lastName']}",
                                          lawyeimage: data['profileImage'] ??
                                              'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
                                          //image: data['profileImage'],
                                        ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .color!,
                                                            width: 2),
                                                      ),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(35),
                                                          child: Image.network(
                                                            data['profileImage'] ??
                                                                'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
                                                            height: 65,
                                                            width: 65,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${data['firstName']} ${data['lastName']}",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: theme
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          lastMessage != null
                                                              ? truncateMot(
                                                                  lastMessage[
                                                                      'replymessage'])
                                                              : 'no message',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: theme
                                                                .textTheme
                                                                .bodyText2!
                                                                .color,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          lastMessage != null
                                                              ? DateFormat(
                                                                      'HH:mm')
                                                                  .format(DateTime.parse(
                                                                      lastMessage[
                                                                          'time']))
                                                              : '00:00',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: theme
                                                                .textTheme
                                                                .displayLarge!
                                                                .color,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Color.fromARGB(34, 0, 0, 0),
                                  ),
                                ],
                              );
                            }
                          },
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
