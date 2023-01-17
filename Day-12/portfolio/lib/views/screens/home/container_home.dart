import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/font-end/animated_positioned.dart';
import '../../components/big_title.dart';
import '../../components/footer.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';

class ContainerHome extends StatelessWidget {
  const ContainerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: gridSystemMyApp(
        context,
        [
          const BigTitle(title: "PRoduct Design"),

          //Item to About me
          item50(
            context,
            list: [
              MyAnimatedPositioned(
                type: Type.text,
                topb: 80,
                topa: 30,
                duration: const Duration(milliseconds: 260),
                fontsizeb: 40,
                colorb: kTextColor,
                colora: Colors.transparent,
                textb: "Hey, I'm Danilz",
              ),
              MyAnimatedPositioned(
                type: Type.text,
                bottomb: 100,
                bottoma: 60,
                duration: const Duration(milliseconds: 260),
                fontsizeb: 18,
                colorb: kTextColor,
                colora: Colors.transparent,
                textb: "\"Design isn't just about making things pretty\"",
              ),
              MyAnimatedPositioned(
                type: Type.text,
                bottomb: 10,
                bottoma: 50,
                duration: const Duration(milliseconds: 260),
                fontsizeb: 48,
                colora: kTextColor,
                colorb: Colors.transparent,
                texta: "Learn\nMore\nAbout Me",
              ),
              MyAnimatedPositioned(
                type: Type.icon,
                duration: const Duration(milliseconds: 260),
                righta: 30,
                rightb: 20,
                bottomb: 30,
                bottoma: 30,
                icon: "assets/icons/all_work.svg",
                colorb: kTextColor,
                colora: kTextColor,
                fontsizeb: 40,
                fontsizea: 40,
              ),
            ],
            press: () {
              context.beamToNamed('about-me');
            },
          ),

          //Item to project detail
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
          ),

          //Item to see all work
          item25(context, list: [
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
          }),

          // Item to my social
          item25(
            context,
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
              launchUrl(
                  Uri.parse("https://www.linkedin.com/in/danilz-d-127482255/"));
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
