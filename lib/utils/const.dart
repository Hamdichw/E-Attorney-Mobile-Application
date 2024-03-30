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
  "Online Payments"
];
List<String> introduction_text = [
  "Get started now and find the best lawyer to advocate for your rights and achieve the best possible outcome for your legal situation.",
  "User-Friendly Interface: Navigate through the hiring process with ease, even if you're new to legal services.",
  "Effortless Transactions: Make payments for legal services quickly and conveniently from the comfort of your own home."
];
final List<Lawyer> data = [
  Lawyer(
      age: 47,
      name: 'seif',
      lastName: 'boubakrie',
      phone: '95687135',
      image: 'assets/images/test1.jpg',
      valide: true,
      location: 'tunis',
      type: 'normal'),
  Lawyer(
      age: 58,
      name: 'iskander',
      lastName: 'channouf',
      phone: '25951412',
      image: 'assets/images/test2.jpg',
      valide: true,
      type: 'gafsa',
      location: 'gafsa'),
  Lawyer(
      age: 78,
      name: 'hamdi',
      lastName: 'chtiwi',
      phone: '22449174',
      image: 'assets/images/test3.jpg',
      location: 'gafsa',
      type: 'normal'),
  Lawyer(
      age: 44,
      name: 'saif',
      lastName: 'klai',
      phone: '26351837',
      image: 'assets/images/avatar.png',
      valide: true,
      location: 'krib',
      type: 'normal'),
  Lawyer(
      age: 51,
      name: 'saif',
      lastName: 'Dabssi',
      phone: '25915880',
      image: 'assets/images/test1.jpg',
      location: 'morouj4',
      type: 'normal'),
  Lawyer(
      age: 66,
      name: 'baha',
      lastName: 'Laamiri',
      phone: '26485618',
      image: 'assets/images/test2.jpg',
      valide: true,
      location: 'takelsa',
      type: 'normal'),
];
