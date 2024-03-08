import 'package:flutter/material.dart';

class Searsh_Field extends StatelessWidget {
  const Searsh_Field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 5, right: 5, bottom: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          filled: true,
          fillColor: Color.fromARGB(131, 216, 216, 216),
          contentPadding: const EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Color.fromARGB(149, 25, 25, 25))),
        ),
      ),
    );
  }
}
