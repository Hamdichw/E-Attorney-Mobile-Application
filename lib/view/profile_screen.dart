import 'package:animated_switch/animated_switch.dart';
import 'package:estichara/utils/theme_service.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/view/authentification/login.dart';
import 'package:flutter/material.dart';
import '/utils/const.dart';
import '/utils/widgets/profile/Profile_menu_widget.dart';
import 'Information_Page.dart';
import 'profile_update_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool dark = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                      width: 70,
                      height: 70,
                      image: AssetImage("assets/images/logo.png")),
                  Text(
                    "Estishara.tn",
                    style: GoogleFonts.electrolize(
                        textStyle: TextStyle(
                            color: btncolor,
                            fontSize: 24,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),

              /// -------------------------- IMAGE-----------------------------
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blueGrey, width: 2),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "assets/images/avatar.png",
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Dali",
                style: GoogleFonts.electrolize(
                    textStyle: TextStyle(
                        color: btncolor,
                        fontSize: 24,
                        fontWeight: FontWeight.normal)),
              ),
              Text(
                "Developpeur Flutter",
                style: GoogleFonts.electrolize(
                    textStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.normal)),
              ),
              const SizedBox(height: 20),
              /*  *************************************** BUTTON **************************** */
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// ******************************** MENU ***********************************
              ProfileMenuWidget(
                title: "User Management",
                icon: Icons.account_circle_outlined,
                onPress: () {
                  Get.to(UpdateProfileScreen());
                },
                isswitch: false,
              ),
              ProfileMenuWidget(
                title: "Langage",
                icon: Icons.language,
                onPress: () {},
                isswitch: false,
              ),
              ProfileMenuWidget(
                endIcon: false,
                title: dark ? "Dark Theme" : "Light theme",
                icon: dark ? Icons.dark_mode : Icons.wb_sunny_outlined,
                Switch: AnimatedSwitch(
                    colorOff: Color(0xffA09F99),
                    colorOn: btncolor,
                    onChanged: (Value) {
                      setState(() {
                        dark = Value;
                      });
                    }),
                onPress: () {},
                isswitch: true,
              ),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Information",
                icon: Icons.info,
                onPress: () {
                  Get.to(Information());
                },
                isswitch: false,
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout,
                textColor: const Color.fromARGB(255, 255, 17, 0),
                endIcon: false,
                onPress: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const login(),
                      ));
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('isLoggedIn');
                },
                isswitch: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
///*********************page de profile********************** */