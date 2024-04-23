import 'package:estichara/view/authentification/resetpassword.dart';
import 'package:get/get.dart';

import '/utils/const.dart';
import '/utils/widgets/text_field.dart';
import '../../controller/authentification/sign_in_controller.dart';

import '../../utils/function.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:animated_switch/animated_switch.dart';

class Login extends StatelessWidget {
  final loginController = Get.lazyPut(() => LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: GetBuilder<LoginController>(
            builder: (controller) => Form(
              key: controller.formKey,
              child: _buildLoginUI(context, controller),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildLoginUI(BuildContext context, LoginController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
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
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            'Get started now ',
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: InputField(
            hintText: "email",
            controller: controller.email,
            prefixIcon: Icon(Icons.mail),
            validator: Validators.validateEmail,
          ),
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: InputField(
              hintText: "password",
              controller: controller.password,
              obscure: controller.visible.value,
              suffixIcon: IconButton(
                onPressed: () {
                  controller.toggleVisibility();
                },
                icon: controller.visible.value
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),
              ),
              prefixIcon: Icon(Icons.lock),
              validator: Validators.validatePassword,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 19, top: 8, right: 19),
          child: Row(
            children: [
              Obx(() => AnimatedSwitch(
                    value: controller.remember.value,
                    colorOff: Color(0xffA09F99),
                    colorOn: btncolor,
                    onChanged: (value) async {
                      controller.remember.value = value;
                    },
                  )),
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
              TextButton(
                onPressed: () {
                  Get.off(ResetPassword());
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
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
            onPressed: () async {
              if (controller.formKey.currentState!.validate()) {
                await controller.login();
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 50),
              backgroundColor: btncolor,
            ),
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
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
                Get.off(() => Signup());
              },
              child: Text(
                "Signup Now",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
