import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

import '../../../../models/font-end/animated_positioned.dart';
import '../../../constans/colors.dart';
import '../../../constans/grid_system.dart';

ResponsiveLayoutCell seeAllWork(BuildContext context) {
  return item25(context, list: [
    MyAnimatedPositioned(
      type: Type.icon,
      duration: const Duration(milliseconds: 260),
      topb: 40,
      topa: 40,
      icon: "assets/icons/all_work.svg",
      colorb: kTextColor,
      colora: kTextColor,
      fontsizeb: 120,
      fontsizea: 0,
    ),
    MyAnimatedPositioned(
      type: Type.text,
      duration: const Duration(milliseconds: 260),
      bottomb: 40,
      bottoma: 60,
      textb: "My Work",
      texta: "View\nAll\nMy Work",
      colorb: kTextColor,
      colora: Colors.transparent,
      fontsizeb: 28,
      fontsizea: 40,
    ),
  ], press: () {
    context.beamToNamed('works');
  });
}
