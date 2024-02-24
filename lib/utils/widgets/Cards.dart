import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const.dart';
import '../function.dart';

class card extends StatelessWidget {
  final String? name;
  final String? Lastname;
  final Widget? Icon;
  final Image? image;
  const card({
    super.key,
    this.name,
    this.Lastname,
    this.Icon,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Add border radius
          border: Border.all(
            color: Color.fromARGB(57, 158, 158, 158), // Add border color
          ),
          color: Colors.white, // Set the background color to white
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Set the shadow color
              spreadRadius: 2, // Set the spread radius of the shadow
              blurRadius: 7, // Set the blur radius of the shadow
              offset: Offset(0, 3), // Set the offset of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            0,
            20,
            0,
            20,
          ),
          child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: image,
              ),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Add some spacing between the top of the card and the title

                    // Add a title widget

                    Text(
                      '$Lastname  $name ',
                      style: TextStyle(
                          color: btncolor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),

                    // Add some spacing between the title and the subtitle

                    // Add a subtitle widget
                    Text(
                      "lawyer ",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
                      ),
                    ),
                    // Add some spacing between the subtitle and the text
                  ],
                ),
              ),
              trailing: Icon
              //const Icon(Icons.arrow_forward_ios, size: 22.0, color: btncolor),
              ),
        ),
      ),
    );
  }
}

class Card4 extends StatefulWidget {
  const Card4({
    Key? key,
  }) : super(key: key);

  @override
  _Card4State createState() => _Card4State();
}

class _Card4State extends State<Card4> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Add border radius
                border: Border.all(
                  color: Color.fromARGB(57, 158, 158, 158), // Add border color
                ),
                color: Colors.white, // Set the background color to white
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(0.1), // Set the shadow color
                    spreadRadius: 2, // Set the spread radius of the shadow
                    blurRadius: 7, // Set the blur radius of the shadow
                    offset: Offset(0, 3), // Set the offset of the shadow
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("information"),
                trailing: Icon(
                    isVisible ? Icons.arrow_downward : Icons.arrow_forward),
              )),
          if (isVisible)
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromARGB(0, 158, 158, 158),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "TRAVEL",
                              style: TextStyle(
                                fontSize: 20,
                                color: MyColorsSample.grey_20,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "5 eats cheap",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: MyColorsSample.grey_80,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              MyStringsSample.middle_lorem_ipsum,
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
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class Card3 extends StatelessWidget {
  const Card3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: btncolor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 15,
              ),
              Text(
                "Call",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.call, color: Colors.white),
                onPressed: () {},
              ),
              Container(
                width: 4,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "John Smith \nTek",
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.teal[800],
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
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
  const Card1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color.fromARGB(0, 158, 158, 158),
        ),
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
                                "ahmed ahmed",
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
                            "lawyer",
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          Container(height: 10),
                          Text(
                            "open to work",
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
                        "22-222-222",
                        style: TextStyle(fontSize: 17),
                      ),
                      Spacer(),
                      Icon(Icons.mail),
                      SizedBox(width: 4),
                      Text(
                        "dali@gmail.com",
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
                        "30 Rue Jamaa Ezzitouna, Tunis",
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
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Add border radius
          border: Border.all(
            color: Color.fromARGB(57, 158, 158, 158), // Add border color
          ),
          color: Colors.white, // Set the background color to white
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Set the shadow color
              spreadRadius: 2, // Set the spread radius of the shadow
              blurRadius: 7, // Set the blur radius of the shadow
              offset: Offset(0, 3), // Set the offset of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            0,
            20,
            0,
            20,
          ),
          child: ListTile(
              leading: Icon(
                Icons.notifications_active,
                color: btncolor,
                size: 25,
              ),
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  msg!,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: btncolor),
                ),
              ),
              trailing: icon
              //const Icon(Icons.arrow_forward_ios, size: 22.0, color: btncolor),
              ),
        ),
      ),
    );
  }
}
