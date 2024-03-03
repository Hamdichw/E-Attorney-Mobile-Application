import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:intl/intl.dart';

import '../const.dart';
import '../function.dart';

class card extends StatelessWidget {
  final String? name;
  final String? Lastname;
  final Image? image;
  const card({
    super.key,
    this.name,
    this.Lastname,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            0,
            20,
            0,
            20,
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: image,
              ),
              SizedBox(width: 22), // Adjust this value as needed
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$Lastname  $name ',
                    style: TextStyle(
                      color: btncolor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "lawyer ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              Spacer(), // This will push the trailing icon to the right
              Icon(Icons.arrow_forward_ios, size: 22.0, color: btncolor),
            ],
          ),
        ),
      ),
    );
  }
}

class Card4 extends StatefulWidget {
  final String? info_text;
  const Card4({
    Key? key,
    this.info_text,
  }) : super(key: key);

  @override
  _Card4State createState() => _Card4State();
}

class _Card4State extends State<Card4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color.fromARGB(255, 158, 158, 158),
        ),
        /* boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0)
                  .withOpacity(0.3), // Set the shadow color
              spreadRadius: 5, // Set the spread radius of the shadow
              blurRadius: 7, // Set the blur radius of the shadow
              offset: Offset(0, 8), // Set the offset of the shadow
            ),
          ] */
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: btncolor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: MyColorsSample.grey_80,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  '${widget.info_text}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  ('assets/images/profile.png'),
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Card3 extends StatefulWidget {
  final String? name;
  final String? lastname;
  final String? phone;
  Card3({
    super.key,
    this.name,
    this.lastname,
    this.phone,
  });

  @override
  State<Card3> createState() => _Card3State();
}

class _Card3State extends State<Card3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: btncolor,
        border: Border.all(
          color: Color.fromARGB(255, 53, 53, 53),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Call",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.call, color: Colors.white),
                onPressed: () async {
                  String? num = widget.phone;
                  await FlutterPhoneDirectCaller.callNumber(num!);
                },
              ),
              SizedBox(width: 4),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              '${widget.name} \n${widget.lastname}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class Card2 extends StatefulWidget {
  Card2({
    Key? key,
  }) : super(key: key);

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    final String formattedDate = formatter.format(selectedDate);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.teal[800],
        border: Border.all(
          color: Color.fromARGB(255, 53, 53, 53),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Add an \nAppointment",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.5,
            height: 0,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 15,
              ),
              Text(
                "$formattedDate",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.event, color: Colors.white),
                onPressed: () async {
                  final DateTime? selectedDate1 = await showDatePickerDialog(
                      context,
                      selectedDate); // Use the showDatePickerDialog function
                  if (selectedDate != null) {
                    setState(() {
                      this.selectedDate = selectedDate1!;
                    });
                  }
                },
              ),
              Container(
                width: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  final String? name;
  final String? lastname;
  final String? adress;
  final String? phone;
  final String? email;
  final String? Bio;
  final String? type;

  Card1({
    super.key,
    this.name,
    this.lastname,
    this.adress,
    this.phone,
    this.email,
    this.Bio,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color.fromARGB(255, 158, 158, 158),
        ),
        /* boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0)
                  .withOpacity(0.3), // Set the shadow color
              spreadRadius: 5, // Set the spread radius of the shadow
              blurRadius: 7, // Set the blur radius of the shadow
              offset: Offset(0, 8), // Set the offset of the shadow
            ),
          ] */
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        ("assets/images/avatar.png"),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(height: 5),
                          Row(
                            children: [
                              Text(
                                "$name $lastname",
                                style: TextStyle(
                                  color: btncolor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.verified,
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                          Container(height: 5),
                          Text(
                            type!,
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          Container(height: 10),
                          Text(
                            Bio!,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Divider(
                  height: 1,
                  color: Color.fromARGB(84, 0, 0, 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 4),
                      Text(
                        phone!,
                        style: TextStyle(fontSize: 17),
                      ),
                      Spacer(),
                      Icon(Icons.mail),
                      SizedBox(width: 4),
                      Text(
                        email!,
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 4),
                      Text(
                        adress! /* "30 Rue Jamaa Ezzitouna, Tunis" */,
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class card_notifcation extends StatelessWidget {
  final String? msg;
  final Widget? icon;
  card_notifcation({
    super.key,
    this.msg,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        height: 80,
        child: ListTile(
            leading: Icon(
              Icons.circle,
              color: btncolor,
              size: 10,
            ),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                msg!,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: btncolor),
              ),
            ),
            trailing: icon),
      ),
    );
  }
}
