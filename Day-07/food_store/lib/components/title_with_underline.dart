import 'package:flutter/material.dart';

class TitleWithUnderline extends StatelessWidget {
  const TitleWithUnderline({
    Key? key,
    required this.text,
    required this.spacing,
    required this.underineColor,
  }) : super(key: key);
  final String text;
  final Color underineColor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: spacing / 4),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(right: spacing / 4),
              height: 8,
              color: underineColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
