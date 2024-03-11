import 'package:estichara/view/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sign_in_with_facebook.dart';
import '../controller/sign_in_with_google.dart';

navigation(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

/* Snackbar */
void showSnackbar(BuildContext context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
    ),
  );
}

//*********************VALIDATORS****************** */
class Validators {
  /* Role Validation */
  static String? validateRole(String? value) {
    if (value == null || value.isEmpty) {
      return "!!";
    }
    return null; // Value is valid
  }

  /* Name Validation */
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Verifier votre Nom";
    } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
      return "Le nom ne doit contenir que des lettres et des espaces";
    } else {
      return null;
    }
  }

  /* LastName Validation */
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Verifier votre Prénom";
    } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
      return "Le Prénom ne doit contenir que des lettres et des espaces";
    } else {
      return null;
    }
  }

  /* Phone Number Validation */
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Verifier votre Numero";
    } else if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
      return "Le numéro de téléphone ne doit contenir que des chiffres";
    } else if (value.length < 8) {
      return "Le numéro de téléphone doit contenir 8 chiffres";
    } else {
      return null; // Validation passed
    }
  }

/* Mail Validation */
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Verifier votre Email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
        .hasMatch(value)) {
      return 'Veuillez saisir une adresse e-mail valide';
    }
    return null;
  }

  /* Password Validation */
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Verifier votre Mot de passe';
    } else if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    return null;
  }
}

Future<DateTime?> showDatePickerDialog(
    BuildContext context, DateTime date_now) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: date_now,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 365)),
  );
  return selectedDate;
}

Future signIn() async {
  final user = await GoogleSignin.login();
  if (user == null) {
    Get.snackbar("login", "failed");
  } else {
    Get.offAll(NavBar());
  }
}

Future signInFacebook() async {
  final user = await FacebookAuthHandler.login();
  if (user == null) {
    Get.snackbar("login", "failed");
  } else {
    Get.to(NavBar());
  }
}
