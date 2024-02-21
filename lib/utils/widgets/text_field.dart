import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscure;

  final String? Function(String?)? validator;

  const InputField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.icon,
      this.validator,
      this.suffixIcon,
      this.obscure,
      this.prefixIcon});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure ?? false,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(0, 216, 216, 221),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
        validator: widget.validator,
      ),
    );
  }
}
