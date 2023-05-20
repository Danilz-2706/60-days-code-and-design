import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

import '../../../model/font-end/animated_positioned.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';

ResponsiveLayoutCell projectFav(
  BuildContext context,
  bool startAnimation, {
  double? leftAnimation,
  double? bottomAnimation,
  double? rightAnimation,
  double? topAnimation,
}) {
  return item50(
    context,
    startAnimation,
    leftAnimation: leftAnimation,
    rightAnimation: rightAnimation,
    bottomAnimation: bottomAnimation,
    topAnimation: topAnimation,
    list: [
      MyAnimatedPositioned(
        type: Type.text,
        topb: 12,
        topa: 20,
        duration: const Duration(milliseconds: 260),
        fontsizeb: 18,
        fontsizea: 22,
        colorb: kTextColor,
        colora: Colors.transparent,
        textb: "Web design",
        texta: "Web's name",
      ),
      MyAnimatedPositioned(
        type: Type.text,
        topb: 40,
        topa: 48,
        duration: const Duration(milliseconds: 260),
        fontsizeb: 28,
        fontsizea: 32,
        colorb: kTextColor,
        colora: Colors.transparent,
        textb: "Web's name",
        texta: "View The Case Study",
      ),
      MyAnimatedPositioned(
        type: Type.picture,
        align: MyAlign.center,
        imagewidthb: 220,
        imagewidtha: 260,
        imagehightb: 160,
        imagehighta: 160,
        bottomb: 0,
        bottoma: -20,
        duration: const Duration(milliseconds: 260),
        image: "assets/images/avatar.png",
      )
    ],
    press: () {},
  );
}
