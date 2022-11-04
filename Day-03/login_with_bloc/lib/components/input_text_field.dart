import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    required this.labelText,
    required this.image,
    required this.errorText,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final String labelText, image;
  final Object? errorText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 18, color: Colors.black),
      obscureText: obscureText,
      decoration: InputDecoration(
          errorText: errorText as String?,
          labelText: labelText,
          prefixIcon: SizedBox(width: 50, child: Image.asset(image)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffCED0D2), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(6)))),
    );
  }
}
