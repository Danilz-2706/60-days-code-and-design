import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constans/colors.dart';
import '../../constans/spacing.dart';

class ItemSocial extends StatelessWidget {
  const ItemSocial({
    super.key,
    required this.icon,
    required this.title,
    required this.link,
  });

  final String icon;
  final String title;
  final String link;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (link.isNotEmpty) {
            launchUrl(Uri.parse(link));
          } else {
            context.beamToNamed('portfolio');
          }
        },
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            color: kSecondaryColor,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: const TextStyle(color: kTextColor, fontSize: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
