import 'package:e_attorney_hub/utils/const.dart';
import 'package:e_attorney_hub/utils/widgets/text_field/text_field.dart';
import 'package:e_attorney_hub/utils/widgets/text_field/text_field_secure.dart';
import 'package:e_attorney_hub/view/nav_bar.dart';

import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:animated_switch/animated_switch.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String Test_email = "123";
  String Test_password = "123";
  bool isSecure = true;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    print(isSecure);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Login(context),
          ),
        ),
      ),
    );
  }

  Column Login(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            'Login',
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
            'Get started now ',
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Field(
          controller: email,
          hint: "email",
          label: "email",
          msg: "enter your email",
        ),
        Field_secure(
          controller: password,
          hint: "password",
          label: "password",
          msg: "enter your password",
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
            // Validate the form
            if (_formKey.currentState!.validate()) {
              // Form is valid, perform login logic here
              String Email = email.text;
              String Password = password.text;
              if (Email == Test_email && Password == Test_password) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBar(),
                    ));
                print('Email: $email, Password: $password');
              }
            }
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(200, 50),
            primary: btncolor,
          ),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => signup(),
                  ),
                );
              },
              child: Text(
                "Signup Now",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ],
    );
  }
}
