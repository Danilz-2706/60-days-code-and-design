import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerTitleList extends StatelessWidget {
  const DrawerTitleList({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: SvgPicture.asset(
        icon,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
