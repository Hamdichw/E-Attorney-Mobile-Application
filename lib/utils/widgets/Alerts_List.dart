import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  Future<List<String>>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: data,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Create a list of Text widgets to display all items
            List<Widget> texts = [];
            for (var i = 0; i < snapshot.data!.length; i++) {
              texts.add(Text(snapshot.data![i]));
            }
            // Return a column containing all Text widgets
            return Column(
              children: texts,
            );
          }
        }),
      ),
    );
  }
}
