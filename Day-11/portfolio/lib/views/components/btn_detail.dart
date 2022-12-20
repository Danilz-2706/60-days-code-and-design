import 'package:flutter/material.dart';

import '../constans/colors.dart';

class BtnDetail extends StatefulWidget {
  const BtnDetail({
    Key? key,
    required this.title,
    required this.color,
    required this.press,
  }) : super(key: key);
  final String title;
  final Color color;
  final VoidCallback press;

  @override
  State<BtnDetail> createState() => _BtnDetailState();
}

class _BtnDetailState extends State<BtnDetail> {
  bool? hover;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        setState(() {
          hover = true;
        });
      },
      onExit: (event) {
        setState(() {
          hover = false;
        });
      },
      child: GestureDetector(
        onTap: widget.press,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          decoration: BoxDecoration(
            gradient: hover == true ? kPrimaryColor : null,
            border: Border.all(
              width: 2.0,
              color: hover == true ? Colors.transparent : kTextColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(color: widget.color, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
