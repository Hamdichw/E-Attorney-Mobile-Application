import 'package:e_attorney_hub/models/lawyers.dart';
import 'package:e_attorney_hub/utils/function.dart';
import 'package:e_attorney_hub/view/details_page.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import 'Cards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Lawyer> data = [
    Lawyer(age: 47, name: 'Leonardo', lastName: 'DiCaprio'),
    Lawyer(age: 58, name: 'Johnny', lastName: 'Depp'),
    Lawyer(age: 78, name: 'Robert', lastName: 'De Niro'),
    Lawyer(age: 44, name: 'Tom', lastName: 'Hardy'),
    Lawyer(age: 66, name: 'Denzel', lastName: 'Washington'),
    Lawyer(age: 66, name: 'Denzel', lastName: 'Washington'),
    Lawyer(age: 66, name: 'Denzel', lastName: 'Washington'),
    Lawyer(age: 66, name: 'Denzel', lastName: 'Washington'),
    Lawyer(age: 49, name: 'Ben', lastName: 'Affleck'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background_color,
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "    Search...",
                hintStyle: const TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(color: Color.fromARGB(112, 0, 0, 0))),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigation(context, Details());
                  },
                  child: Column(
                    children: [
                      card(
                        name: data[index].name,
                        Lastname: data[index].lastName,
                        Icon: const Icon(Icons.arrow_forward_ios,
                            size: 22.0, color: Colors.black),
                        image:
                            const Image(image: AssetImage("images/images.jpg")),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
