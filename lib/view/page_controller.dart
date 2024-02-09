import 'package:flutter/material.dart';
import 'package:e_attorney_hub/view/screen1.dart';
import 'package:e_attorney_hub/view/screen2.dart';
import 'package:e_attorney_hub/view/screen3.dart';
import 'package:e_attorney_hub/view/screen4.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPageIndex < 3) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPageIndex++;
      });
    } else {
      // Handle when the last page is reached
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          children: [
            Screen1(
              onNext: _nextPage,
              currentIndex: _currentPageIndex,
              pageCount: 4, // Total number of pages/screens
            ),
            Screen2(
              onNext: _nextPage,
              currentIndex: _currentPageIndex,
              pageCount: 4,
            ),
            Screen3(
              onNext: _nextPage,
              currentIndex: _currentPageIndex,
              pageCount: 4,
            ),
            Screen4(),
          ],
        ),
      ),
    );
  }
}
