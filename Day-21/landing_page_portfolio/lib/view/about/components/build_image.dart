import 'package:flutter/material.dart';

import '../../components/image_card.dart';
import '../../constans/spacing.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({
    super.key,
    required this.startAnimation,
    this.leftAnimation,
    this.bottomAnimation,
    this.rightAnimation,
    this.topAnimation,
    required this.pic,
  });

  final bool startAnimation;
  final String pic;
  final double? leftAnimation;
  final double? bottomAnimation;
  final double? rightAnimation;
  final double? topAnimation;

  @override
  Widget build(BuildContext context) {
    return ImageCard(
      pic: pic,
      startAnimation: startAnimation,
      // leftAnimation: leftAnimation,
      // bottomAnimation: bottomAnimation,
      // rightAnimation: rightAnimation,
      // topAnimation: topAnimation,
    );
  }
}
