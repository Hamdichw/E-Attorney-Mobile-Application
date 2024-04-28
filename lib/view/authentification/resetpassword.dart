import 'package:estichara/utils/function.dart';
import 'package:estichara/view/authentification/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../utils/widgets/text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

TextEditingController email = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Get.off(Login());
        },
      )),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Reset your Password.',
                    style: TextStyle(
                      color: btncolor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  child: InputField(
                    hintText: 'enter your email',
                    controller: email,
                    validator: Validators.validateEmail,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        ResetPasswordFunction(email.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50),
                      backgroundColor: btncolor,
                    ),
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
