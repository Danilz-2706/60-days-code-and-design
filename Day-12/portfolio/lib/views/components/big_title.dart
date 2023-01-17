import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/grid_system.dart';

import '../constans/colors.dart';
import '../constans/responsive.dart';

class BigTitle extends StatelessWidget {
  const BigTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return gridSystemMyApp(
      context,
      [
        item100(
          context,
          widget: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MyResponsive.isDesktop(context)
                      ? 200
                      : MyResponsive.isTablet(context)
                          ? 150
                          : 100,
                  child: FittedBox(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: kBigTitleTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
