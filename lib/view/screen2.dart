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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Image(
                height: 450, width: 500, image: AssetImage('images/toph3.png')),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              "Easy To hire",
              style: TextStyle(
                  color: btncolor, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: DotsIndicator(
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
          ),
          Next(onNext: onNext),
        ],
      ),
    );
  }
}
