import 'package:animated_switch/animated_switch.dart';
import 'package:estichara/utils/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/sign_in_with_facebook.dart';
import '../controller/sign_in_with_google.dart';
import '../utils/function.dart';
import '/view/authentification/login.dart';
import '/view/first_screens/screen4.dart';
import 'package:flutter/material.dart';
import '/utils/const.dart';
import '../utils/widgets/Profile_menu_widget.dart';
import 'Information_Page.dart';
import 'language.dart';
import 'profile_update_screen.dart';
import 'theme_mode.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<dynamic>? userDataList;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    userDataList = await fetchData();
    setState(() {}); // Update UI after data is fetched
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Logo and App Name
              Row(
                children: [
                  Image(
                    width: 70,
                    height: 70,
                    image: AssetImage("assets/images/logo.png"),
                  ),
                  Text(
                    "Estishara.tn",
                    style: GoogleFonts.electrolize(
                      textStyle: TextStyle(
                        color: btncolor,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              if (userDataList != null) ...[
                // Profile Image and Name
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
                            child: Image.network(
                              userDataList![5],
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
                SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      "${userDataList![2]} ",
                      style: GoogleFonts.electrolize(
                        textStyle: TextStyle(
                          color: theme.textTheme.bodyText1!.color,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Text(
                      "${userDataList![6]}",
                      style: GoogleFonts.electrolize(
                        textStyle: TextStyle(
                          color: theme.textTheme.displayLarge!.color,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Divider
                Divider(color: theme.textTheme.displayLarge!.color),
                SizedBox(height: 10),
                // Profile Menu Items
                ProfileMenuWidget(
                  title: "Update Profile",
                  icon: Icons.account_circle_outlined,
                  onPress: () => Get.to(UpdateProfileScreen()),
                  isswitch: true,
                ),
                ProfileMenuWidget(
                  title: "Language",
                  icon: Icons.language,
                  onPress: () => Get.off(Language()),
                  isswitch: true,
                ),
                ProfileMenuWidget(
                  title: "Dark Theme",
                  icon: Icons.dark_mode,
                  onPress: () => Get.off(Mode()),
                  isswitch: true,
                ),
                Divider(color: theme.textTheme.displayLarge!.color),
                SizedBox(height: 10),
                ProfileMenuWidget(
                  title: "Information",
                  icon: Icons.info,
                  onPress: () => Get.to(Information()),
                  isswitch: false,
                ),
                ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: const Color.fromARGB(255, 255, 17, 0),
                  endIcon: false,
                  onPress: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirm Logout"),
                          content: Text("Are you sure you want to logout?"),
                          actions: <Widget>[
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text("Logout"),
                              onPressed: () async {
                                Navigator.of(context)
                                    .pop(); // Close the AlertDialog
                                Navigator.pushReplacement(
                                  // Navigate to the login screen and remove the current route from the navigation stack
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Screen4(),
                                  ),
                                );
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.remove('isLoggedIn');
                                await prefs.remove('userData');
                                await prefs.remove('userDataGoogle');
                                // Handle logout from Google and Facebook
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  isswitch: false,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
