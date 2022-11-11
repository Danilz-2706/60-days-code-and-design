import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    Key? key,
    required this.text,
    required this.press,
    required this.colorbutton,
  }) : super(key: key);

  final String text;
  final Color colorbutton;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorbutton),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: press,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
