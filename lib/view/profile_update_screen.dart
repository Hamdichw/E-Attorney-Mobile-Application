import '/utils/const.dart';
import '/utils/function.dart';
import '/utils/widgets/text_field.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController vfpassword = TextEditingController();
  bool obscure = true;
  bool visible = true;
  bool visible1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ********************************************* IMAGE with ICON *************************************** //
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage('assets/images/images.jpg'))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: btncolor),
                      child: const Icon(Icons.camera,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // ****************************************************** Form Fields ************************************ //
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputField(
                      hintText: "Full name",
                      controller: name,
                      validator: Validators.validateName,
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                      ),
                    ),
                    InputField(
                      hintText: "Email",
                      controller: email,
                      validator: Validators.validateEmail,
                      prefixIcon: Icon(Icons.email),
                    ),
                    InputField(
                      hintText: "phone",
                      controller: phone,
                      validator: Validators.validatePhone,
                      prefixIcon: Icon(Icons.phone),
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
                      prefixIcon: Icon(Icons.lock),
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
                      prefixIcon: Icon(Icons.lock),
                    ),
                    const SizedBox(height: 20),
                    // ************************************ Form Submit Button **************************************** //
                    const SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(btncolor),
                            side: MaterialStatePropertyAll(BorderSide.none),
                            shape: MaterialStatePropertyAll(StadiumBorder())),
                        child: Text("Edit Profile",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
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
