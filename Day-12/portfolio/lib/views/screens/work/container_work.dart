import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../models/font-end/animated_positioned.dart';
import '../../components/big_title.dart';
import '../../components/footer.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';
import '../../constans/responsive.dart';

class ContainerWork extends StatelessWidget {
  const ContainerWork({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: gridSystemMyApp(
        context,
        [
          const BigTitle(title: "All work"),
          item50(
            context,
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
                fontsizeb: 26,
                fontsizea: 30,
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
            press: () {
              context.beamToNamed('/works/1');
            },
          ),
          item25(
            context,
            list: [
              MyAnimatedPositioned(
                type: Type.text,
                topb: !MyResponsive.isTablet(context) ? 12 : 30,
                topa: !MyResponsive.isTablet(context) ? 16 : 34,
                duration: const Duration(milliseconds: 260),
                fontsizeb: !MyResponsive.isTablet(context) ? 18 : 22,
                fontsizea: 22,
                colorb: kTextColor,
                colora: Colors.transparent,
                textb: "Android App",
                texta: "INDIENOW",
              ),
              if (!MyResponsive.isTablet(context))
                MyAnimatedPositioned(
                  type: Type.text,
                  topb: 40,
                  topa: 44,
                  duration: const Duration(milliseconds: 260),
                  fontsizeb: 26,
                  fontsizea: 28,
                  colorb: kTextColor,
                  colora: Colors.transparent,
                  textb: "indieNOW",
                  texta: "View The Case Study",
                ),
              MyAnimatedPositioned(
                type: Type.picture,
                align: MyAlign.center,
                imagewidthb: 130,
                imagewidtha: !MyResponsive.isTablet(context) ? 170 : 140,
                imagehightb: !MyResponsive.isTablet(context) ? 160 : 170,
                imagehighta: 160,
                bottomb: 0,
                bottoma: !MyResponsive.isTablet(context) ? -40 : -10,
                duration: const Duration(milliseconds: 260),
                image: "assets/images/avatar.png",
              )
            ],
            press: () {
              context.beamToNamed('/works/2');
            },
          ),
          item100(
            context,
            widget: const Footer(),
          ),
        ],
      ),
    );
  }
}
