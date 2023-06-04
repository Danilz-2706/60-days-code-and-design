import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../constans/colors.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    Key? key,
    required this.pic,
    this.size,
    required this.startAnimation,
    this.leftAnimation,
    this.bottomAnimation,
    this.rightAnimation,
    this.topAnimation,
    this.video = false,
    this.press,
  }) : super(key: key);
  final String pic;
  final double? size;
  final bool startAnimation;
  final double? leftAnimation;
  final double? bottomAnimation;
  final double? rightAnimation;
  final double? topAnimation;
  final bool? video;
  final VoidCallback? press;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 500),
            left: widget.startAnimation && widget.leftAnimation != null
                ? 0
                : widget.leftAnimation,
            right: widget.startAnimation && widget.rightAnimation != null
                ? 0
                : widget.rightAnimation,
            top: widget.startAnimation && widget.topAnimation != null
                ? 0
                : widget.topAnimation,
            bottom: widget.startAnimation && widget.bottomAnimation != null
                ? 0
                : widget.bottomAnimation,
            child: widget.video!
                ? Stack(
                    children: [
                      CachedNetworkImage(
                        placeholder: (context, url) => const SizedBox(
                          height: 280,
                          child: RiveAnimation.asset(
                              "assets/animations/anima_reply-ing.riv"),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageUrl: widget.pic,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            height: widget.size,
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
                        },
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: widget.press,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                                color: kSecondaryColor.withOpacity(0.4),
                              ),
                              child: Center(
                                child: IconButton(
                                  iconSize: 50,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.play_circle_outline_rounded,
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : CachedNetworkImage(
                    placeholder: (context, url) => const SizedBox(
                      height: 280,
                      child: RiveAnimation.asset(
                          "assets/animations/anima_reply-ing.riv"),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: widget.pic,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: widget.size,
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
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
