import '/utils/const.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/Cards.dart';

class Details extends StatefulWidget {
  final String Name;
  final String Lastname;
  final String Type;
  final String? Phone;
  final String images;
  final bool? valide;
  final String? email;
  final String? adress;
  final String? bio;
  final int id;
  final int userid;

  Details(
      {super.key,
      required this.Name,
      required this.Lastname,
      required this.Type,
      this.Phone,
      required this.images,
      this.valide,
      this.email,
      this.adress,
      this.bio,
      required this.id,
      required this.userid});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: Column(
          children: [
            Card1(
              image: widget.images,
              name: widget.Name,
              lastname: widget.Lastname,
              Bio: "open to work",
              phone: widget.Phone,
              email: widget.email,
              adress: widget.adress,
              type: widget.Type,
              valide: widget.valide,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Card2(
                      FirstName: widget.Name,
                      LastName: widget.Lastname,
                      phone: widget.Phone,
                      id: widget.id,
                      userid: widget.userid,
                    ),
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.02),
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
              info_text: widget.bio,
            ),
            SizedBox(
              height: 13,
            )
          ],
        ),
      ),
    ); //);
  }
}
