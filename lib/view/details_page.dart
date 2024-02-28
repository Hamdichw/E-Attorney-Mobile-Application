import '/utils/const.dart';
import 'package:flutter/material.dart';

import '../utils/widgets/Cards.dart';

class Details extends StatefulWidget {
  final String Name;
  final String Lastname;
  final String Type;
  final String? Phone;

  const Details(
      {super.key,
      required this.Name,
      required this.Lastname,
      required this.Type,
      this.Phone});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "View Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: btncolor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Card1(
                name: widget.Name,
                lastname: widget.Lastname,
                Bio: "open to work",
                phone: widget.Phone,
                email: "dali@gmail.com",
                adress: "30 Rue Jamaa Ezzitouna, Tunis",
                type: widget.Type,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Card2(),
                    ),
                    Container(width: 2),
                    Expanded(
                      flex: 1,
                      child: Card3(
                          name: widget.Name,
                          lastname: widget.Lastname,
                          phone: widget.Phone),
                    ),
                  ],
                ),
              ),
              Card4(
                info_text: 'blabla blabla blabla blablablabla',
              ),
              SizedBox(
                height: 13,
              )
            ],
          ),
        ),
      ),
    );
  }
}
