// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '/utils/widgets/text_field.dart';
import '/view/nav_bar.dart';
import '../../utils/const.dart';
import '../../utils/function.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:animated_switch/animated_switch.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController vfpassword = TextEditingController();

  bool visible = true;
  bool visible1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: btncolor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Please Signup before get started.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InputField(
                  hintText: "email",
                  controller: email,
                  validator: Validators.validateEmail,
                ),
                InputField(
                  hintText: "name",
                  controller: name,
                  validator: Validators.validateName,
                ),
                InputField(
                  hintText: "password",
                  controller: password,
                  obscure: visible,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: visible == true
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                  ),
                  icon: Icons.lock,
                  validator: Validators.validatePassword,
                ),
                InputField(
                  hintText: "Conform Password",
                  controller: vfpassword,
                  obscure: visible1,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visible1 = !visible1;
                      });
                    },
                    icon: visible1 == true
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                  ),
                  icon: Icons.lock,
                  validator: Validators.validatePassword,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 19, top: 8, right: 19),
                  child: Row(
                    children: [
                      AnimatedSwitch(
                        colorOff: Color(0xffA09F99),
                        colorOn: btncolor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      navigation(context, NavBar());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    // Set height and width
                    fixedSize: Size(200, 50),
                    // Set button color
                    primary: btncolor,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Alredy have an accont?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login(),
                          ),
                        );
                      },
                      child: Text(
                        "Login now",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
