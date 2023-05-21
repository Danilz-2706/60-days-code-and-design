import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/font-end/animated_positioned.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';

ResponsiveLayoutCell mySocial(
  BuildContext context,
  bool startAnimation, {
  double? leftAnimation,
  double? bottomAnimation,
  double? rightAnimation,
  double? topAnimation,
}) {
  return item25(
    context,
    startAnimation,
    leftAnimation: leftAnimation,
    rightAnimation: rightAnimation,
    bottomAnimation: bottomAnimation,
    topAnimation: topAnimation,
    list: [
      MyAnimatedPositioned(
        type: Type.icon,
        align: MyAlign.center,
        duration: const Duration(milliseconds: 260),
        topb: 40,
        topa: 40,
        icon: "assets/icons/linkind.svg",
        colorb: kTextColor,
        colora: kTextColor,
        fontsizeb: 120,
        fontsizea: 140,
      ),
      MyAnimatedPositioned(
        type: Type.text,
        align: MyAlign.center,
        duration: const Duration(milliseconds: 260),
        bottomb: 30,
        bottoma: 40,
        textb: "Let's Connect",
        colora: kTextColor,
        colorb: Colors.transparent,
        fontsizeb: 32,
      ),
    ],
    press: () {
      launchUrl(Uri.parse("https://www.linkedin.com/in/danilz27062000/"));
    },
  );
}
