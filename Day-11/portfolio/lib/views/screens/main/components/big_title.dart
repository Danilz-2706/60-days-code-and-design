import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:responsive_ui/responsive_ui.dart';

class BigTitle extends StatelessWidget {
  const BigTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Responsive(children: [
      Div(
        divison: const Division(
          colXL: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 130,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(252, 250, 244, 0.32),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
