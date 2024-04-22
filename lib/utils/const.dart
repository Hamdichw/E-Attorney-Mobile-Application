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
final List<Lawyer> data = [
  Lawyer(
      firstName: 'seif',
      lastName: 'boubakrie',
      phoneNumber: '95687135',
      image: 'assets/images/test1.jpg',
      valide: true,
      address: 'tunis',
      bio: 'normal'),
  Lawyer(
      firstName: 'iskander',
      lastName: 'channouf',
      phoneNumber: '25951412',
      image: 'assets/images/test2.jpg',
      valide: true,
      bio: 'gafsa',
      address: 'gafsa'),
  Lawyer(
      firstName: 'hamdi',
      lastName: 'chtiwi',
      phoneNumber: '22449174',
      image: 'assets/images/test3.jpg',
      address: 'gafsa',
      bio: 'normal'),
  Lawyer(
      firstName: 'saif',
      lastName: 'klai',
      phoneNumber: '26351837',
      image: 'assets/images/avatar.png',
      valide: true,
      address: 'krib',
      bio: 'normal'),
  Lawyer(
      firstName: 'saif',
      lastName: 'Dabssi',
      phoneNumber: '25915880',
      image: 'assets/images/test1.jpg',
      address: 'morouj4',
      bio: 'normal'),
  Lawyer(
      firstName: 'baha',
      lastName: 'Laamiri',
      phoneNumber: '26485618',
      image: 'assets/images/test2.jpg',
      valide: true,
      address: 'takelsa',
      bio: 'normal'),
];
