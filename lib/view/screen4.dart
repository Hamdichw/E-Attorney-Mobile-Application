import 'package:e_attorney_hub/utils/const.dart';
import 'package:e_attorney_hub/view/login.dart';
import 'package:flutter/material.dart';

import '../utils/widgets/btn_screen4.dart';

class Screen4 extends StatelessWidget {
  const Screen4({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: Text(
                      "Welcome!",
                      style: TextStyle(
                          color: btncolor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("We're happy to see you here.")),
                Image(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.height * 0.05,
                    image: AssetImage('images/mobile_login.png')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                btn_screen4(
                    text: "Continue with Facebook",
                    icon: Icon(
                      Icons.facebook,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: btncolor,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.018,
                ),
                btn_screen4(
                    text: "Continue with Google",
                    icon: Icon(
                      Icons.email_sharp,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: btncolor,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text(
              'Signup With Email',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(
                  MediaQuery.of(context).size.width * 0.55,
                  MediaQuery.of(context).size.height * 0.06)),
              backgroundColor: MaterialStatePropertyAll(btncolor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login(),
                        ));
                  },
                  child: Text(
                    "Login now",
                    style: TextStyle(color: btncolor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
