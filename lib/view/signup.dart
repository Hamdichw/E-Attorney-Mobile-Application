// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  bool isSecure = true;
  bool isSecure1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
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
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email Adress',
                    label: Text('Email Address'),
                    fillColor: Color.fromARGB(0, 216, 216, 221),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'User',
                    label: Text('UserName'),
                    fillColor: Color.fromARGB(0, 216, 216, 221),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: isSecure,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    suffixIcon: isSecure
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            icon: Icon(Icons.visibility_off))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            icon: Icon(Icons.visibility)),
                    fillColor: Color.fromARGB(0, 216, 216, 221),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: isSecure1,
                  decoration: InputDecoration(
                    label: Text('Conform Password'),
                    suffixIcon: isSecure1
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isSecure1 = !isSecure1;
                              });
                            },
                            icon: Icon(Icons.visibility_off))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isSecure1 = !isSecure1;
                              });
                            },
                            icon: Icon(Icons.visibility)),
                    fillColor: Color.fromARGB(0, 216, 216, 221),
                    filled: true,
                  ),
                ),
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
    );
  }
}
