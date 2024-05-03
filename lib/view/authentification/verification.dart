import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../utils/widgets/text_field.dart';

class Verification extends StatefulWidget {
  final Future<String> CodeVerif;
  final VoidCallback onSuccess;
  const Verification(
      {super.key, required this.CodeVerif, required this.onSuccess});

  @override
  State<Verification> createState() => _VerificationState();
}

TextEditingController verification = TextEditingController();

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              'Verification.',
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: InputField(
              hintText: 'enter verification',
              controller: verification,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                // Get the verification code
                String code = await widget.CodeVerif;

                // Compare the verification code
                if (verification.text == code) {
                  print("Verification successful");
                  widget.onSuccess();
                } else {
                  showDialog(
                    context: Get.context!,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text('Signup Failed'),
                        contentPadding: EdgeInsets.all(20),
                        children: [
                          Text('check the correct verification in your email')
                        ],
                      );
                    },
                  );
                  print("Verification failed");
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 50),
                backgroundColor: btncolor,
              ),
              child: Text(
                'verif',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
