import 'package:file_picker/file_picker.dart';

import 'chat/chat_page.dart';
import '/view/find_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '/utils/const.dart';
import 'add_doc_page.dart';
import 'chat/chat.dart';
import 'notification_page.dart';
import 'profile_screen.dart';

class NavBar extends StatefulWidget {
  final int? indx;
  NavBar({Key? key, this.indx}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

/// ******* index de page a le demarrage ******///
class _NavBarState extends State<NavBar> {
  int _pageIndex = 2;
  late PageController _pageController;
  List<PlatformFile> files = [];
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _pageIndex = widget.indx ?? _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        ///*******************navigation et element ************************ */
        child: CurvedNavigationBar(
          color: theme.backgroundColor,
          buttonBackgroundColor: theme.backgroundColor,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          index: _pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(
              Icons.note_add_outlined,
              size: 30,
              color: theme.textTheme.bodyText1!.color,
            ),
            Icon(
              Icons.chat_bubble_outline,
              size: 30,
              color: theme.textTheme.bodyText1!.color,
            ),
            Icon(
              Icons.home_outlined,
              size: 30,
              color: theme.textTheme.bodyText1!.color,
            ),
            Icon(
              Icons.notifications_outlined,
              size: 30,
              color: theme.textTheme.bodyText1!.color,
            ),
            Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: theme.textTheme.bodyText1!.color,
            ),
          ],

          ///************animation de scroll*************** */
          onTap: (index) {
            setState(() {
              _pageIndex = index;
              _pageController.animateToPage(
                _pageIndex,
                duration: const Duration(milliseconds: 700),
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

        ///********les pages de navbar******** */
        children: <Widget>[
          AddDoc(files: files),
          Chat(),
          const FindPage(),
          NotitcationTap(),
          const ProfileScreen()
        ],
      ),
    );
  }
}
