import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/lawyers.dart';
import '../utils/const.dart';
import '../utils/widgets/List_Lawyer.dart';
import '../utils/widgets/Search_bar.dart';
import '../utils/widgets/SearshField.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  String dropdownValue = "Tunis";
  var items = ["Tunis", "Ariana", "Nabel", "Sousse", "Medenine", "Gafsa"];
  bool show = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  "Estishara.tn",
                  style: GoogleFonts.electrolize(
                    textStyle: TextStyle(
                      color: btncolor,
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    /*  setState(() {
                      show = !show;
                    }); */
                    showSearch(context: context, delegate: SearshData());
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
                    "Find by :",
                    style: GoogleFonts.electrolize(
                      textStyle: TextStyle(
                        color: btncolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
                              child: Text("lieux"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
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
                            Icon(Icons.person_2_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text("Type"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (show) Searsh_Field(),
            Expanded(
              child: HomePage(),
            ),
          ],
        ),
      ),
    );
  }
}
