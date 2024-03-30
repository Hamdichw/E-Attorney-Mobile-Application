import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../../utils/widgets/Button.dart';
import '../../../utils/const.dart';
import '/view/first_screens/screen4.dart';

class Screen1 extends StatefulWidget {
  final VoidCallback onNext;

  Screen1({Key? key, required this.onNext}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int x = 1;

  String url = "assets/images/screen1.gif";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    widget.onNext();
                  },
                ),
              ),
              Image.asset(
                url,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Text(
                introduction_title[x - 1],
                style: TextStyle(
                  color: btncolor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90,
                  child: Center(
                    child: Text(
                      introduction_text[x - 1],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              DotsIndicator(
                dotsCount: 4, // Corrected the count to match your txt list
                position: x - 1,
                decorator: DotsDecorator(
                  activeColor: btncolor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.023,
              ),
              Next(
                onNext: () {
                  if (x < 3) {
                    setState(() {
                      x++;
                      url = "assets/images/screen$x.gif";
                    });
                  } else {
                    widget.onNext(); // Corrected function invocation
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
