import 'package:get/get.dart';

import '../utils/theme_service.dart';
import '/utils/const.dart';
import '/utils/function.dart';
import '/utils/widgets/text_field.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController vfpassword = TextEditingController();
  bool obscure = true;
  bool visible = true;
  bool visible1 = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text("8".tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Themes().changeTheme();
            },
            icon: Icon(
              Icons.dark_mode,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // ********************************************* IMAGE with ICON *************************************** //
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage('assets/images/images.jpg'))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(255, 0, 0, 0)),
                      child:
                          const Icon(Icons.edit, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // ****************************************************** Form Fields ************************************ //
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputField(
                      hintText: "9".tr,
                      controller: name,
                      validator: Validators.validateName,
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                      ),
                    ),
                    InputField(
                      hintText: "10".tr,
                      controller: email,
                      validator: Validators.validateEmail,
                      prefixIcon: Icon(Icons.email),
                    ),
                    InputField(
                      hintText: "11".tr,
                      controller: phone,
                      validator: Validators.validatePhone,
                      prefixIcon: Icon(Icons.phone),
                    ),
                    InputField(
                      hintText: "12".tr,
                      controller: password,
                      obscure: visible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: visible == true
                            ? Icon(
                                Icons.visibility,
                                color: theme.textTheme.displayLarge!.color,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: theme.textTheme.displayLarge!.color,
                              ),
                      ),
                      icon: Icons.lock,
                      validator: Validators.validatePassword,
                      prefixIcon: Icon(Icons.lock),
                    ),
                    InputField(
                      hintText: "12".tr,
                      controller: vfpassword,
                      obscure: visible1,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visible1 = !visible1;
                          });
                        },
                        icon: visible == true
                            ? Icon(
                                Icons.visibility,
                                color: theme.textTheme.displayLarge!.color,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: theme.textTheme.displayLarge!.color,
                              ),
                      ),
                      icon: Icons.lock,
                      validator: Validators.validatePassword,
                      prefixIcon: Icon(Icons.lock),
                    ),
                    const SizedBox(height: 20),
                    // ************************************ Form Submit Button **************************************** //
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(btncolor),
                            side: MaterialStatePropertyAll(BorderSide.none),
                            shape: MaterialStatePropertyAll(StadiumBorder())),
                        child: Text("13".tr,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
