import '/utils/const.dart';
import 'package:flutter/material.dart';

class Next extends StatelessWidget {
  final VoidCallback onNext;

  const Next({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: onNext,
      style: ElevatedButton.styleFrom(
        // Set height and width
        fixedSize: Size(200, 50),
        // Set button color
        primary: btncolor,
      ),
      child: Text(
        'Next',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ));
  }
}

class btn_screen4 extends StatelessWidget {
  final String text;
  final Icon icon;
  const btn_screen4({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(
                MediaQuery.of(context).size.width * 0.74,
                MediaQuery.of(context).size.height * 0.06)),
            backgroundColor: MaterialStatePropertyAll(Color(0xffe4eaf0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 8, 0), child: icon),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Color(0xff4a5b67),
                      fontSize: MediaQuery.of(context).size.height * 0.019),
                ),
              ),
            ],
          )),
    );
  }
}
