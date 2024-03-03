import 'package:estichara/utils/widgets/Cards.dart';
import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              card_notifcation(
                msg: 'you have meeting tomorrow ',
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              Divider(
                height: 1,
              )
            ],
          );
        },
      ),
    );
  }
}
