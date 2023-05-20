import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landing_page_portfolio/view/constans/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/fake_data.dart';
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
      children: List.generate(
        list_social2.length,
        (index) {
          if (index > 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding / 2.0),
              child: IconSocial(
                type: list_social2[index]['title']!,
                name: list_social2[index]['name']!,
                url: list_social2[index]['link']!,
                icon: list_social2[index]['icon']!,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class IconSocial extends StatelessWidget {
  const IconSocial({
    super.key,
    required this.url,
    required this.name,
    required this.type,
    required this.icon,
  });

  final String url;
  final String name;
  final String type;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(url));
        },
        child: Tooltip(
          preferBelow: false,
          message: "$type: $name",
          child: SvgPicture.asset(
            icon,
            height: 32,
            colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
