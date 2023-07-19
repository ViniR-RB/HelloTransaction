import 'package:flutter/material.dart';

class CustomObscureTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const CustomObscureTextField(
      {super.key, required this.controller, required this.label});

  @override
  State<CustomObscureTextField> createState() => _CustomObscureTextFieldState();
}

class _CustomObscureTextFieldState extends State<CustomObscureTextField> {
  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: showText,
        decoration: InputDecoration(
            labelText: widget.label,
            suffixIcon: showText == true
                ? GestureDetector(
                    onTap: () => setState(() {
                          showText = !showText;
                        }),
                    child: const Icon(Icons.visibility_off))
                : GestureDetector(
                    onTap: () => setState(() {
                          showText = !showText;
                        }),
                    child: const Icon(Icons.visibility))),
      ),
    );
  }
}
