import 'package:get/get.dart';

import '/utils/const.dart';
import '/utils/widgets/buttons/btn_next.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'screen4.dart';

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
                      Get.to(Screen4());
                    },
                  )),
              Image.asset(
                "assets/images/screen2.gif",
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Text(
                "Easy To hire",
                style: TextStyle(
                    color: btncolor, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
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
                height: MediaQuery.of(context).size.height * 0.023,
              ),
              Next(onNext: onNext),
            ],
          ),
        ),
      ),
    );
  }
}
