import 'package:e_attorney_hub/utils/const.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                            image: AssetImage('images/images.jpg'))),
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
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Full name"),
                          prefixIcon: Icon(Icons.account_circle_outlined)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Email"), prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Phone"), prefixIcon: Icon(Icons.phone)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: obscure,
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon: IconButton(
                            icon: obscure
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            }),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ************************************ Form Submit Button **************************************** //
                    const SizedBox(
                      width: 200,
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
                    const SizedBox(height: 20),

                    // ************************** Created Date and Delete Button ***************************************//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: "joined",
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: "Joined At",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text("Delete"),
                        ),
                      ],
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
