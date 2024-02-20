import 'package:e_attorney_hub/models/lawyers.dart';
import 'package:e_attorney_hub/view/chat_page.dart';
import 'package:flutter/material.dart';

import '../const.dart';

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 5, right: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
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
                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Chat_Page(),
                          )); */
                    },
                    child: Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      elevation: 5, // Add elevation for a shadow effect
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Add border radius
                        side:
                            BorderSide(color: Colors.grey), // Add border color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ListTile(
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                  image: AssetImage("images/Berserk.webp")),
                            ),
                          ),
                          title: Text(
                            '${data?[index].lastName}  ${data[index].name} ',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          trailing: const Icon(Icons.arrow_forward_outlined,
                              size: 18.0, color: btncolor),
                        ),
                      ),
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
