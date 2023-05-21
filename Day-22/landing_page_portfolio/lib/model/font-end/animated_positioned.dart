import 'package:flutter/material.dart';

enum Type {
  text,
  picture,
  icon,
  widget,
}

enum MyAlign {
  left,
  center,
  right,
}

class MyAnimatedPositioned {
  final Type type;
  final MyAlign? align;
  final double? topb,
      bottomb,
      leftb,
      rightb,
      topa,
      bottoma,
      lefta,
      righta,
      fontsizeb,
      fontsizea,
      imagewidthb,
      imagewidtha,
      imagehightb,
      imagehighta;
  final String? textb, texta, image, icon;
  final Duration duration;
  final Color? colorb, colora;
  final Widget? widgetchild;

  MyAnimatedPositioned({
    required this.type,
    this.image,
    this.align,
    this.textb,
    this.texta,
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
    this.imagewidthb,
    this.imagewidtha,
    this.imagehightb,
    this.imagehighta,
    this.colorb,
    this.widgetchild,
    this.icon,
    required this.duration,
    this.colora,
  });
}
