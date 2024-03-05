import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  List<String> messages = [
    'you have meeting tomorrow',
    'you have an appointment',
    'you have a task due'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(messages[index]),
            onDismissed: (direction) {
              setState(() {
                messages.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Container(
                height: 80,
                child: ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: Colors.blue,
                    size: 10,
                  ),
                  title: Align(
                    alignment: Alignment.center,
                    child: Text(
                      messages[index],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
