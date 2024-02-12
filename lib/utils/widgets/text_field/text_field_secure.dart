import 'package:flutter/material.dart';

class Field_secure extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final String msg;

  Field_secure({
    Key? key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.msg,
  }) : super(key: key);

  @override
  State<Field_secure> createState() => _Field_secureState();
}

class _Field_secureState extends State<Field_secure> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isSecure, // Use the isSecure state here
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isSecure = !isSecure; // Toggle the isSecure state
              });
            },
            icon: Icon(isSecure ? Icons.visibility_off : Icons.visibility),
          ),
          fillColor: Color.fromARGB(0, 216, 216, 221),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.msg;
          }
          // You can add more email validation logic here if needed
          return null;
        },
      ),
    );
  }
}
