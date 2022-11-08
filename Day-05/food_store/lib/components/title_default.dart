import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  const TitleDefault({
    Key? key,
    required this.title,
    required this.time,
  }) : super(key: key);

  final String title, time;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title\n",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          TextSpan(
            text: time,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white54,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
