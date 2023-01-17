import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.label,
    required this.hinttext,
    required this.color,
    required this.lines,
    required this.textController,
    this.onChanged,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  final String label, hinttext;
  final Color color;
  final int lines;
  final TextEditingController textController;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      style: const TextStyle(color: kTextColor, fontSize: 18.0),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        labelText: label,
        hintText: hinttext,
        hintStyle:
            TextStyle(color: kTextColor.withOpacity(0.5), fontSize: 18.0),
        labelStyle: const TextStyle(color: kTextColor, fontSize: 18.0),
        floatingLabelStyle: const TextStyle(color: kTextColor, fontSize: 16.0),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        focusedBorder: outlineInputBorder(),
        border: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
          color: Color.fromARGB(235, 241, 222, 43),
          strokeAlign: StrokeAlign.outside),
      gapPadding: 2,
    );
  }
}
