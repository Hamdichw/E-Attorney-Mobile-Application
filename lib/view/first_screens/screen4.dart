import 'package:estichara/view/nav_bar.dart';

import '../../controller/sign_in_with_google.dart';
import '../../utils/function.dart';
import '../../utils/widgets/Button.dart';
import '/utils/const.dart';
import '/view/authentification/login.dart';
import '/view/authentification/signup.dart';
import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                              color: theme.textTheme.bodyText1!.color,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text("We're happy to see you here.")),
                    Image.asset(
                      "assets/images/screen4.png",
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    btn_screen4(
                        onpress: () => signInFacebook(),
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
                      onpress: () =>
                          signIn() /* async {
                        final user = await GoogleSignin.login();
                        if (user != null)
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => NavBar(),
                            ),
                          );
                      } */
                      , // Use a lambda function
                      text: "Continue with Google",
                      icon: Icon(
                        Icons.email_sharp,
                        size: MediaQuery.of(context).size.height * 0.03,
                        color: btncolor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Signup(),
                      ));
                },
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(
                      MediaQuery.of(context).size.width * 0.55,
                      MediaQuery.of(context).size.height * 0.06)),
                  backgroundColor: const MaterialStatePropertyAll(btncolor),
                ),
                child: const Text(
                  'Signup With Email',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          color: theme.textTheme.bodyText1!.color,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
