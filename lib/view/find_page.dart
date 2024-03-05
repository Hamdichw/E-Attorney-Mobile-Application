import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/const.dart';
import '../utils/widgets/List_Lawyer.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  String dropdownValue = "Tunis";
  var items = ["Tunis", "Ariana", "Nabel", "Sousse", "Medenine", "Gafsa"];
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Row(
            children: [
              Image(
                  width: 70,
                  height: 70,
                  image: AssetImage("assets/images/logo.png")),
              Text(
                "Estishara.tn",
                style: GoogleFonts.electrolize(
                    textStyle: TextStyle(
                        color: btncolor,
                        fontSize: 24,
                        fontWeight: FontWeight.normal)),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  )),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    "Find by :",
                    style: GoogleFonts.electrolize(
                        textStyle: TextStyle(
                            color: btncolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 35,

                    //color: Color(0xFF957f60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(139, 158, 158, 158)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: DropdownButton(
                          items: items.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
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
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 35,

                    //color: Color(0xFF957f60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(139, 158, 158, 158)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: DropdownButton(
                          items: items.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
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
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 35,

                    //color: Color(0xFF957f60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(139, 158, 158, 158)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: DropdownButton(
                          items: items.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
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
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (show)
            Padding(
              padding:
                  const EdgeInsets.only(top: 16, left: 5, right: 5, bottom: 8),
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
                  fillColor: Color.fromARGB(131, 216, 216, 216),
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: Color.fromARGB(149, 25, 25, 25))),
                ),
              ),
            ),
          Expanded(
            child: HomePage(),
          ),
        ]),
      ),
    );
  }
}
