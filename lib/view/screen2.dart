import 'package:e_attorney_hub/utils/const.dart';
import 'package:e_attorney_hub/utils/widgets/btn_next.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Screen2 extends StatelessWidget {
  final VoidCallback onNext;
  final int currentIndex;
  final int pageCount;

  const Screen2({
    Key? key,
    required this.onNext,
    required this.currentIndex,
    required this.pageCount,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 450,
            width: 450,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/toph2.png'),
                    fit: BoxFit.scaleDown)),
          ),
          /* Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Image(
                height: 400, width: 300, image: AssetImage('images/toph2.png')),
          ), */
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              "Easy To hire",
              style: TextStyle(
                  color: btncolor, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          DotsIndicator(
            dotsCount: pageCount,
            position: currentIndex,
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
            height: 20,
          ),
          Next(onNext: onNext),
        ],
      ),
    );
  }
}
