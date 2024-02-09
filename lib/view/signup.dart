// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_attorney_hub/utils/widgets/text_field.dart';
import 'package:e_attorney_hub/utils/widgets/text_field_secure.dart';

import '../utils/const.dart';
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

  bool isSecure = true;
  bool isSecure1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
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
                    'Please Signup before get started',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Field(
                    controller: email,
                    hint: "email adresse",
                    label: "email adresse",
                    msg: "give email adresse"),
                Field(
                    controller: name,
                    hint: "user name",
                    label: "name",
                    msg: "give user name"),
                Field_secure(
                    controller: password,
                    hint: "Password",
                    label: "password",
                    msg: "give your password"),
                Field_secure(
                    controller: vfpassword,
                    hint: "Conform Password",
                    label: "Conform Password",
                    msg: "repete your psw"),
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
                  onPressed: () {},
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
                Padding(
                  padding: EdgeInsets.only(left: 100.0, top: 0),
                  child: Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
