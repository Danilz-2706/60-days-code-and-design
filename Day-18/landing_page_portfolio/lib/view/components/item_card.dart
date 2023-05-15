import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/font-end/animated_positioned.dart';
import '../constans/colors.dart';
import '../constans/spacing.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.list,
    required this.press,
  });
  final List<MyAnimatedPositioned> list;
  final VoidCallback? press;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor:
            widget.press != null ? SystemMouseCursors.click : MouseCursor.defer,
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            height: 280,
            decoration: BoxDecoration(
              gradient: widget.press != null
                  ? hover == false
                      ? kSecondaryColorlinear
                      : kPrimaryColor
                  : kSecondaryColorlinear,
              borderRadius: const BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  top: kDefaultPadding / 2),
              child: Stack(
                fit: StackFit.expand,
                children: List.generate(
                  widget.list.length,
                  (index) {
                    //Position for Text
                    if (widget.list[index].type == Type.text) {
                      return Stack(
                        alignment: widget.list[index].align == MyAlign.center
                            ? Alignment.center
                            : AlignmentDirectional.topStart,
                        fit: StackFit.expand,
                        children: [
                          _PositionedText(
                            hover: hover,
                            duration: widget.list[index].duration,
                            textb: widget.list[index].textb,
                            texta: widget.list[index].texta,
                            topb: widget.list[index].topb,
                            topa: widget.list[index].topa,
                            bottomb: widget.list[index].bottomb,
                            bottoma: widget.list[index].bottoma,
                            leftb: widget.list[index].leftb,
                            lefta: widget.list[index].lefta,
                            rightb: widget.list[index].rightb,
                            righta: widget.list[index].righta,
                            colorb: widget.list[index].colorb,
                            colora: widget.list[index].colora,
                            fontsizeb: widget.list[index].fontsizeb,
                            fontsizea: widget.list[index].fontsizea,
                          ),
                        ],
                      );
                    }
                    //Position for Image
                    else if (widget.list[index].type == Type.picture) {
                      return Stack(
                        alignment: widget.list[index].align == MyAlign.center
                            ? Alignment.center
                            : AlignmentDirectional.topStart,
                        fit: StackFit.expand,
                        children: [
                          _PositionedImage(
                            hover: hover,
                            duration: widget.list[index].duration,
                            image: widget.list[index].image,
                            topb: widget.list[index].topb,
                            topa: widget.list[index].topa,
                            bottomb: widget.list[index].bottomb,
                            bottoma: widget.list[index].bottoma,
                            leftb: widget.list[index].leftb,
                            lefta: widget.list[index].lefta,
                            rightb: widget.list[index].rightb,
                            righta: widget.list[index].righta,
                            imagewidthb: widget.list[index].imagewidthb,
                            imagewidtha: widget.list[index].imagewidtha,
                            imagehightb: widget.list[index].imagehightb,
                            imagehighta: widget.list[index].imagehighta,
                          ),
                        ],
                      );
                    }
                    //Position for Icon
                    else if (widget.list[index].type == Type.icon) {
                      return Stack(
                        alignment: widget.list[index].align == MyAlign.center
                            ? Alignment.center
                            : AlignmentDirectional.topStart,
                        fit: StackFit.expand,
                        children: [
                          _PositionedIcon(
                            hover: hover,
                            duration: widget.list[index].duration,
                            icon: widget.list[index].icon,
                            topb: widget.list[index].topb,
                            topa: widget.list[index].topa,
                            bottomb: widget.list[index].bottomb,
                            bottoma: widget.list[index].bottoma,
                            leftb: widget.list[index].leftb,
                            lefta: widget.list[index].lefta,
                            rightb: widget.list[index].rightb,
                            righta: widget.list[index].righta,
                            fontsizea: widget.list[index].fontsizea,
                            fontsizeb: widget.list[index].fontsizeb,
                            colorb: widget.list[index].colorb,
                            colora: widget.list[index].colora,
                          ),
                        ],
                      );
                    }
                    //Position for Widget
                    else if (widget.list[index].type == Type.widget) {
                      return Stack(
                        alignment: widget.list[index].align == MyAlign.center
                            ? Alignment.center
                            : widget.list[index].align == MyAlign.right
                                ? AlignmentDirectional.centerEnd
                                : AlignmentDirectional.topCenter,
                        fit: StackFit.expand,
                        children: [
                          _PositionedWidget(
                            hover: hover,
                            duration: widget.list[index].duration,
                            widgetchild: widget.list[index].widgetchild,
                            topb: widget.list[index].topb,
                            topa: widget.list[index].topa,
                            bottomb: widget.list[index].bottomb,
                            bottoma: widget.list[index].bottoma,
                            leftb: widget.list[index].leftb,
                            lefta: widget.list[index].lefta,
                            rightb: widget.list[index].rightb,
                            righta: widget.list[index].righta,
                            fontsizea: widget.list[index].fontsizea,
                            fontsizeb: widget.list[index].fontsizeb,
                            colorb: widget.list[index].colorb,
                            colora: widget.list[index].colora,
                          ),
                        ],
                      );
                    }
                    //Position for Another
                    else {
                      return const Text("No data -- Component Empty");
                    }
                  },
                ),
              ),
            ),
          ),
        ));
  }
}

//Another widget
class _PositionedWidget extends StatelessWidget {
  const _PositionedWidget({
    Key? key,
    required this.hover,
    this.topb,
    this.bottomb,
    this.leftb,
    this.rightb,
    this.topa,
    this.bottoma,
    this.lefta,
    this.righta,
    this.fontsizeb,
    this.fontsizea,
    this.widgetchild,
    required this.duration,
    this.colorb,
    this.colora,
  }) : super(key: key);

  final bool hover;
  final double? topb,
      bottomb,
      leftb,
      rightb,
      topa,
      bottoma,
      lefta,
      righta,
      fontsizeb,
      fontsizea;
  final Widget? widgetchild;
  final Duration duration;
  final Color? colorb, colora;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: hover == false ? topb : topa,
      bottom: hover == false ? bottomb : bottoma,
      left: hover == false ? leftb : lefta,
      right: hover == false ? rightb : righta,
      duration: duration,
      child: AnimatedContainer(
        duration: duration,
        height: hover == false ? fontsizeb : fontsizea,
        width: hover == false ? fontsizeb : fontsizea,
        child: widgetchild,
      ),
    );
  }
}

//Icon
class _PositionedIcon extends StatelessWidget {
  const _PositionedIcon({
    Key? key,
    required this.hover,
    this.topb,
    this.bottomb,
    this.leftb,
    this.rightb,
    this.topa,
    this.bottoma,
    this.lefta,
    this.righta,
    this.fontsizeb,
    this.fontsizea,
    this.icon,
    required this.duration,
    this.colorb,
    this.colora,
  }) : super(key: key);

  final bool hover;
  final double? topb,
      bottomb,
      leftb,
      rightb,
      topa,
      bottoma,
      lefta,
      righta,
      fontsizeb,
      fontsizea;
  final String? icon;
  final Duration duration;
  final Color? colorb, colora;

  @override
  Widget build(BuildContext context) {
    try {
      return AnimatedPositioned(
        top: hover == false ? topb : topa,
        bottom: hover == false ? bottomb : bottoma,
        left: hover == false ? leftb : lefta,
        right: hover == false ? rightb : righta,
        duration: duration,
        child: AnimatedContainer(
          duration: duration,
          height: hover == false ? fontsizeb : fontsizea,
          width: hover == false ? fontsizeb : fontsizea,
          child: SvgPicture.asset(
            icon!,
            color: hover == false ? colorb : colora,
          ),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print("Loi o dong nay ne");
    }
    return Container();
  }
}

//Text
class _PositionedText extends StatelessWidget {
  const _PositionedText({
    Key? key,
    required this.hover,
    this.topb,
    this.bottomb,
    this.leftb,
    this.rightb,
    this.topa,
    this.bottoma,
    this.lefta,
    this.righta,
    this.fontsizeb,
    this.fontsizea,
    required this.textb,
    required this.duration,
    this.texta,
    this.colorb,
    this.colora,
  }) : super(key: key);

  final bool hover;
  final double? topb,
      bottomb,
      leftb,
      rightb,
      topa,
      bottoma,
      lefta,
      righta,
      fontsizeb,
      fontsizea;
  final String? textb, texta;
  final Duration duration;
  final Color? colorb, colora;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: hover == false ? topb : topa,
      bottom: hover == false ? bottomb : bottoma,
      left: hover == false ? leftb : lefta,
      right: hover == false ? rightb : righta,
      duration: duration,
      child: AnimatedDefaultTextStyle(
        duration: duration,
        style: TextStyle(
          fontFamily: "DMSans",
          fontSize: textb != null && texta != null
              ? hover == false
                  ? fontsizeb
                  : fontsizea
              : fontsizeb,
          color: textb != null && texta != null
              ? colorb
              : hover == false
                  ? colorb
                  : colora,
        ),
        child: Text(
          textb != null && texta != null
              ? hover == false
                  ? textb!
                  : texta!
              : textb != null && texta == null
                  ? textb!
                  : texta != null && textb == null
                      ? texta!
                      : "",
        ),
      ),
    );
  }
}

//Image
class _PositionedImage extends StatelessWidget {
  const _PositionedImage({
    Key? key,
    required this.hover,
    this.topb,
    this.bottomb,
    this.leftb,
    this.rightb,
    this.topa,
    this.bottoma,
    this.lefta,
    this.righta,
    this.imagewidthb,
    this.imagewidtha,
    this.imagehightb,
    this.imagehighta,
    required this.image,
    required this.duration,
  }) : super(key: key);

  final bool hover;
  final double? topb,
      bottomb,
      leftb,
      rightb,
      topa,
      bottoma,
      lefta,
      righta,
      imagewidthb,
      imagewidtha,
      imagehightb,
      imagehighta;
  final String? image;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: hover == false ? topb : topa,
      bottom: hover == false ? bottomb : bottoma,
      left: hover == false ? leftb : lefta,
      right: hover == false ? rightb : righta,
      duration: duration,
      child: AnimatedContainer(
        duration: duration,
        width: hover == false ? imagewidthb : imagewidtha,
        height: hover == false ? imagehightb : imagehighta,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          image: DecorationImage(
            image: AssetImage(image!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
