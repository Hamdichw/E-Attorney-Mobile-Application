import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/const.dart';
import 'List_Lawyer.dart';
import '../../utils/widgets/Search_bar.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  String dropdownValue = "All";

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Image(
                  width: 70,
                  height: 70,
                  image: AssetImage("assets/images/logo.png"),
                ),
                Text(
                  "Estishara",
                  style: GoogleFonts.electrolize(
                    textStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.6)
                          : btncolor,
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchData());
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    "${"16".tr} :",
                    style: TextStyle(
                      color: btncolor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color.fromARGB(139, 158, 158, 158),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: DropdownButton(
                        menuMaxHeight: 300,
                        items: items.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        borderRadius: BorderRadius.circular(35),
                        hint: Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(dropdownValue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: HomePage(
                Ville: dropdownValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
