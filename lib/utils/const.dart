import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//button color
const btncolor = Color.fromARGB(255, 33, 52, 66);
const Color Background_color = Color(0xffe3e3ef);
const Color secondary = Color(0xffe9ebec);

class Application_Name extends StatelessWidget {
  const Application_Name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
            width: 70, height: 70, image: AssetImage("assets/images/logo.png")),
        Text(
          "Estishara.tn",
          style: GoogleFonts.electrolize(
              textStyle: TextStyle(
                  color: btncolor,
                  fontSize: 24,
                  fontWeight: FontWeight.normal)),
        ),
      ],
    );
  }
}
