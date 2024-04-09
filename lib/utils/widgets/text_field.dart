import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscure;
  final bool? readonly;
  final VoidCallback? onPressed;
  final String? Function(String?)? validator;

  const InputField(
      {super.key,
      required this.hintText,
      this.controller,
      this.icon,
      this.validator,
      this.suffixIcon,
      this.obscure,
      this.prefixIcon,
      this.readonly,
      this.onPressed});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller ?? null,
      obscureText: widget.obscure ?? false,
      readOnly: widget.readonly ?? false,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(0, 216, 216, 221),
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.onPressed != null
            ? IconButton(
                icon: Icon(Icons.event),
                onPressed: widget.onPressed!,
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
      ),
      validator: widget.validator,
    );
  }
}
