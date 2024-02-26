import '/utils/const.dart';
import '/utils/widgets/text_field.dart';

import '/view/nav_bar.dart';

import '../../utils/function.dart';
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
  String Test_email = "dali@g";
  String Test_password = "12345678";
  bool visible = true;
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            'Login',
            style: TextStyle(
              color: btncolor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            'Get started now ',
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        InputField(
          hintText: "email",
          controller: email,
          icon: Icons.mail,
          validator: Validators.validateEmail,
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
        const Padding(
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
        const SizedBox(
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
                navigation(context, NavBar());
              }
            }
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 50),
            primary: btncolor,
          ),
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
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
                    builder: (context) => const signup(),
                  ),
                );
              },
              child: const Text(
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
