import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final String msg;
  Field({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.msg,
  });

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          fillColor: Color.fromARGB(0, 216, 216, 221),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
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
