import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.pic,
    this.size,
    required this.startAnimation,
    this.leftAnimation,
    this.bottomAnimation,
    this.rightAnimation,
    this.topAnimation,
  }) : super(key: key);
  final String pic;
  final double? size;
  final bool startAnimation;
  final double? leftAnimation;
  final double? bottomAnimation;
  final double? rightAnimation;
  final double? topAnimation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 400,
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 500),
            left: startAnimation && leftAnimation != null ? 0 : leftAnimation,
            right:
                startAnimation && rightAnimation != null ? 0 : rightAnimation,
            top: startAnimation && topAnimation != null ? 0 : topAnimation,
            bottom:
                startAnimation && bottomAnimation != null ? 0 : bottomAnimation,
            child: CachedNetworkImage(
                placeholder: (context, url) => const SizedBox(
                      height: 280,
                      child: RiveAnimation.asset(
                          "assets/animations/anima_reply-ing.riv"),
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: pic,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: size ?? 400,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      image: DecorationImage(
                        onError: (exception, stackTrace) {},
                        isAntiAlias: true,
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
