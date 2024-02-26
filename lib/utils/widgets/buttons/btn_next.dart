import '/utils/const.dart';
import 'package:flutter/material.dart';

class Next extends StatelessWidget {
  final VoidCallback onNext;

  const Next({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: onNext,
      style: ElevatedButton.styleFrom(
        // Set height and width
        fixedSize: Size(200, 50),
        // Set button color
        primary: btncolor,
      ),
      child: Text(
        'Next',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
