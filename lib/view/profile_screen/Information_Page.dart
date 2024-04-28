import 'package:estichara/utils/const.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the Application'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.info,
              size: 100,
              color: btncolor,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Consulting Lawyer Mobile Application',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: btncolor),
            ),
            SizedBox(height: 16),
            Text(
              'Developed by Mohamed Ali and Hamdi for their PFE',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Features:',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: btncolor),
            ),
            SizedBox(height: 8),
            Text(
              '- User authentication and authorization.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '- Profile management for both users and lawyers.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '- Real-time chat with lawyers.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '- Secure share of document.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '- Appointment scheduling and management.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
