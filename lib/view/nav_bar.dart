import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_attorney_hub/utils/const.dart';
import 'package:e_attorney_hub/view/login.dart';
import 'package:e_attorney_hub/view/screen4.dart';
import 'package:e_attorney_hub/view/signup.dart';

import 'profile_screen.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _pageIndex = 2;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: CurvedNavigationBar(
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          index: _pageIndex,
          height: 50.0,
          items: const <Widget>[
            Icon(
              Icons.add,
              size: 30,
              color: btncolor,
            ),
            Icon(
              Icons.wechat_outlined,
              size: 30,
              color: btncolor,
            ),
            Icon(
              Icons.home_filled,
              size: 30,
              color: btncolor,
            ),
            Icon(
              Icons.notifications_outlined,
              size: 30,
              color: btncolor,
            ),
            Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: btncolor,
            ),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
              _pageController.animateToPage(
                _pageIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: const <Widget>[
          login(),
          signup(),
          Screen4(),
          Screen4(),
          ProfileScreen()
        ],
      ),
    );
  }
}
