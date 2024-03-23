import 'package:flutter/material.dart';
import '/view/first_screens/screen4.dart';
import 'introduction.dart';

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
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPageIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.9),
        body: PageView(
          //physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },

          ///**********les pages***************** */
          children: [
            Screen1(
              onNext: _nextPage,
            ),
            const Screen4(),
          ],
        ),
      ),
    );
  }
}
//************page controlle les 4 premiers page utilise pageview***************** */