import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/cubits/cubit_export.dart';
import '../../constans/colors.dart';
import '../../constans/spacing.dart';

class ItemSocial extends StatefulWidget {
  const ItemSocial({
    super.key,
    required this.icon,
    required this.title,
    required this.link,
    this.startAnimation = false,
    this.positionX = 0.0,
    this.positionY = 0.0,
    this.positionZ = 0.0,
    this.duration = 0,
  });

  final String icon;
  final String title;
  final String link;
  final bool? startAnimation;
  final double? positionX;
  final double? positionY;
  final double? positionZ;
  final int? duration;

  @override
  State<ItemSocial> createState() => _ItemSocialState();
}

class _ItemSocialState extends State<ItemSocial> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: Stack(
        children: [
          AnimatedPositioned(
            bottom: widget.startAnimation! ? 0 : widget.positionY,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500 + widget.duration!),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (event) {
                setState(() {
                  hover = true;
                });
              },
              onExit: (event) {
                setState(() {
                  hover = false;
                });
              },
              child: GestureDetector(
                onTap: () {
                  if (widget.link.isNotEmpty) {
                    launchUrl(Uri.parse(widget.link));
                  } else {
                    context.beamToNamed('portfolio');
                  }
                },
                child: Tooltip(
                  verticalOffset: 32,
                  message: widget.link,
                  child: AnimatedContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kDefaultPadding / 4),
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: hover == false
                          ? kSecondaryColorlinear
                          : kPrimaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    duration: Duration(milliseconds: 500 + widget.duration!),
                    curve: Curves.easeInOut,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          widget.icon,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.title,
                          style:
                              const TextStyle(color: kTextColor, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
