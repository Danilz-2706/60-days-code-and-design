import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constans/colors.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              launchUrl(Uri.parse("https://www.facebook.com/TD.8266328/"));
            },
            child: SvgPicture.asset(
              "assets/icons/facebook.svg",
              height: 32,
              color: kTextColor,
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              launchUrl(Uri.parse("https://www.instagram.com/danilz.2762/"));
            },
            child: SvgPicture.asset(
              "assets/icons/instagram.svg",
              height: 32,
              color: kTextColor,
            ),
          ),
        )
      ],
    );
  }
}
