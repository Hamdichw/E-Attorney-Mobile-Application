import 'package:e_attorney_hub/utils/const.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "View Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: btncolor),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Cards_widget(),
      ),
    );
  }
}

class Cards_widget extends StatelessWidget {
  const Cards_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: secondary,
            elevation: 5, // Add elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Add border radius
              side: const BorderSide(
                  color: Color.fromARGB(0, 158, 158, 158)), // Add border color
            ),
            // Define the shape of the card

            // Define how the card's content should be clipped
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // Define the child widget of the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Add padding around the row widget
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Add an image widget to display an image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              ("images/avatar.png"),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Add some spacing between the image and the text
                          Container(width: 30),
                          // Add an expanded widget to take up the remaining horizontal space
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Add some spacing between the top of the card and the title
                                Container(height: 5),
                                // Add a title widget
                                const Row(
                                  children: [
                                    Text(
                                      "ahmed ahmed",
                                      style: TextStyle(
                                          color: btncolor,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.verified,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                                // Add some spacing between the title and the subtitle
                                Container(height: 5),
                                // Add a subtitle widget
                                Text(
                                  "lawyer ",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                // Add some spacing between the subtitle and the text
                                Container(height: 10),
                                // Add a text widget to display some text
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
                      const Divider(
                        height: 1,
                        color: Color.fromARGB(84, 0, 0, 0),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "22-222-222",
                              style: TextStyle(fontSize: 17),
                            ),
                            Spacer(),
                            Icon(Icons.mail),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "dali@gmail.com",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "30 Rue Jamaa Ezzitouna, Tunis",
                              style: TextStyle(fontSize: 17),
                            )
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //color: Colors.teal[800],
                  color: btncolor,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          "Today Event \nLive",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.5,
                        height: 0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 15,
                          ),
                          const Text(
                            "March 19, 2023",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.event, color: Colors.white),
                            onPressed: () {},
                          ),
                          Container(
                            width: 4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(width: 2),
              Expanded(
                flex: 1,
                child: Card(
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
                          const Text(
                            "Call",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.call, color: Colors.white),
                            onPressed: () {},
                          ),
                          Container(
                            width: 4,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          "John Smith \nTek",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: secondary,
            elevation: 5, // Add elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Add border radius
              side: const BorderSide(
                  color: Color.fromARGB(0, 158, 158, 158)), // Add border color
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  ('images/profile.png'),
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("TRAVEL",
                          style: MyTextSample.button(context)!
                              .copyWith(color: MyColorsSample.grey_20)),
                      Container(height: 5),
                      Text("5 eats cheap",
                          style: MyTextSample.headline(context)!
                              .copyWith(color: MyColorsSample.grey_80)),
                      Container(height: 15),
                      Text(MyStringsSample.middle_lorem_ipsum,
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600])),
                      Container(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
