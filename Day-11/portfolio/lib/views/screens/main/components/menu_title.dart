import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/colors.dart';

import '../../../constans/responsive.dart';

class MenuTitle extends StatefulWidget {
  const MenuTitle({
    Key? key,
    required this.title,
    required this.color,
    required this.press,
  }) : super(key: key);
  final String title;
  final Color color;
  final VoidCallback press;

  @override
  State<MenuTitle> createState() => _MenuTitleState();
}

class _MenuTitleState extends State<MenuTitle> {
  bool? hover;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
        onTap: widget.press,
        child: Container(
            margin: const EdgeInsets.only(left: 12),
            child: GradientText(
              text: widget.title,
              style: TextStyle(
                  fontSize: Responsive1.isDesktop(context) ? 28 : 18,
                  color: widget.color),
              gradient: hover == true ? kPrimaryColor : null,
            )),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
    required this.style,
  });

  final String text;
  final TextStyle style;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return gradient != null
        ? ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => gradient!.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(text, style: style),
          )
        : Text(
            text,
            style: style,
          );
  }
}
