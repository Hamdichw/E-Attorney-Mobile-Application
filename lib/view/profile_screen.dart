import 'package:e_attorney_hub/view/authentification/login.dart';
import 'package:flutter/material.dart';
import 'package:e_attorney_hub/utils/const.dart';
import 'package:e_attorney_hub/utils/widgets/profile/Profile_menu_widget.dart';
import 'profile_update_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// -------------------------- IMAGE-----------------------------
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage("images/images.jpg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: btncolor),
                      child: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("Dali", style: Theme.of(context).textTheme.headlineMedium),
              Text("Developpeur Flutter",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              /*  *************************************** BUTTON **************************** */
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const UpdateProfileScreen()));
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(btncolor),
                      side: MaterialStatePropertyAll(BorderSide.none),
                      shape: MaterialStatePropertyAll(StadiumBorder())),
                  child: const Text("Edit Profile",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// ******************************** MENU ***********************************
              ProfileMenuWidget(
                  title: "Settings", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(
                  title: "Billing Details", icon: Icons.wallet, onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management",
                  icon: Icons.account_circle_outlined,
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information", icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const login(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
///*********************page de profile********************** */