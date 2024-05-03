import 'package:estichara/view/authentification/login.dart';
import 'package:get/get.dart';

import '../../controller/authentification/sign_up_controller.dart';
import 'verification.dart';
import '/utils/widgets/text_field.dart';
import '../../utils/const.dart';
import '../../utils/function.dart';
import 'package:flutter/material.dart';
import 'package:animated_switch/animated_switch.dart';

class Signup extends StatelessWidget {
  final signupController = Get.lazyPut(() => SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: GetBuilder<SignupController>(
            builder: (controller) => Form(
              key: controller.formKey,
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: InputField(
                            hintText: "First Name",
                            controller: controller.firstNameController,
                            validator: Validators.validateName,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InputField(
                            hintText: "Last Name",
                            controller: controller.lastNameController,
                            validator: Validators.validateLastName,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: InputField(
                            hintText: "phone",
                            controller: controller.phoneController,
                            validator: Validators.validatePhone,
                            // Add validator if needed
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InputField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your birthday';
                              }
                              return null;
                            },
                            hintText: 'Birthday',
                            controller: controller.birthController,
                            readonly: true,
                            onPressed: () async {
                              // Provide the onPressed callback
                              final DateTime? selectedDate1 =
                                  await showDatePicker(
                                context: context,
                                initialDate: controller.selectedDate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (selectedDate1 != null) {
                                controller.selectedDate = selectedDate1;
                                controller.birthController.text =
                                    selectedDate1.year.toString() +
                                        "/" +
                                        selectedDate1.month.toString() +
                                        "/" +
                                        selectedDate1.day.toString();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    child: InputField(
                      hintText: "Email",
                      controller: controller.emailController,
                      validator: Validators.validateEmail,
                      // Add validator if needed
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 15),
                      child: InputField(
                        hintText: "Password",
                        controller: controller.passwordController,
                        obscure: controller.visible.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.toggleVisibility();
                          },
                          icon: controller.visible.value
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                        ),
                        validator: Validators.validatePassword,
                        // Add validator if needed
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.formKey.currentState!.validate()) {
                          Future<String> code = controller.Verificationcode(
                              controller.emailController.text);
                          print("the code is :$code");
                          Get.to(Verification(
                            CodeVerif: code,
                            onSuccess: () {
                              controller.signUp();
                            },
                          ));
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
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(Login());
                        },
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
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
      ),
    );
  }
}
