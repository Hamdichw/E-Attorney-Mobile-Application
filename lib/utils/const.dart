import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/lawyers.dart';

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

List<String> introduction_title = [
  "Find The Best lawyer",
  "Easy To hire",
  "Digital signature"
];
List<String> introduction_text = [
  "Get started now and find the best lawyer to advocate for your rights and achieve the best possible outcome for your legal situation.",
  "User-Friendly Interface: Navigate through the hiring process with ease, even if you're new to legal services.",
  "Digital signatures provide unparalleled security for your app's documents by ensuring authenticity, integrity, and non-repudiation, safeguarding against tampering and unauthorized alterations."
];
var items = [
  "Ariana",
  "Beja",
  "Ben Arous",
  "Bizerte",
  "Gabes",
  "Gafsa",
  "Jendouba",
  "Kairouan",
  "Kasserine",
  "Kebili",
  "Kef",
  "Mahdia",
  "Manouba",
  "Medenine",
  "Monastir",
  "Nabeul",
  "Sfax",
  "Sidi Bouzid",
  "Siliana",
  "Sousse",
  "Tataouine",
  "Tozeur",
  "Tunis",
  "Zaghouan"
];
