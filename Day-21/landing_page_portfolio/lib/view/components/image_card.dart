import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:video_player/video_player.dart';

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
  }) : super(key: key);
  final String pic;
  final double? size;
  final bool startAnimation;
  final double? leftAnimation;
  final double? bottomAnimation;
  final double? rightAnimation;
  final double? topAnimation;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    if (widget.pic.contains(".mp4")) {
      _controller = VideoPlayerController.network(widget.pic)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
            child: widget.pic.contains(".mp4")
                ? _controller.value.isInitialized
                    ? Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: kSecondaryColor,
                            child: VideoPlayer(_controller),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: _controller.value.isPlaying
                                      ? null
                                      : kSecondaryColor.withOpacity(0.4),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _controller.value.isPlaying
                                              ? _controller.pause()
                                              : _controller.play();
                                        });
                                      },
                                      icon: _controller.value.isPlaying
                                          ? Container()
                                          : const Icon(Icons
                                              .play_circle_outline_rounded),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container()
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
