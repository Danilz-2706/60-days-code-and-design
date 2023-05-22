// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:landing_page_portfolio/view/constans/spacing.dart';
import 'package:video_player/video_player.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../controller/cubits/cubit_export.dart';
import '../components/big_title.dart';
import '../components/footer.dart';
import '../components/image_card.dart';
import '../constans/colors.dart';
import '../constans/grid_system.dart';
import '../constans/responsive.dart';
import 'components/build_about_image.dart';
import 'components/text_about_me.dart';
import 'components/top.dart';
import 'components/welcome.dart';

class Pic {
  final String pic, size;
  Pic(
    this.size, {
    required this.pic,
  });
}

class ContainerAbout extends StatefulWidget {
  const ContainerAbout({super.key});

  @override
  State<ContainerAbout> createState() => _ContainerAboutState();
}

class _ContainerAboutState extends State<ContainerAbout> {
  late ScrollController scrollController;
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    Future.delayed(const Duration(microseconds: 500), () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          startAnimation = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebSmoothScroll(
      controller: scrollController,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        slivers: [
          Top(startAnimation: startAnimation),
          Mid(startAnimation: startAnimation),
          SliverToBoxAdapter(
            child: gridSystemMyApp(
              context,
              [
                item100(
                  context,
                  false,
                  widget: const Footer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Mid extends StatelessWidget {
  const Mid({
    super.key,
    required this.startAnimation,
  });

  final bool startAnimation;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ImageThumbnailProfileCubit, ImageThumnailProfileState>(
      builder: (context, state) {
        if (state is ImageThumnailLoading) {
          return SliverToBoxAdapter(
            child: gridSystemMyApp(
              context,
              [
                item100(
                  context,
                  false,
                  widget: Container(),
                ),
              ],
            ),
          );
        } else if (state is ImageThumbnaiLoaded) {
          var list = state.listVideo;
          return SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: MyResponsive.isMobile(context)
                  ? size.width * 0.06
                  : MyResponsive.isTablet(context)
                      ? size.width * 0.08
                      : size.width > 1397
                          ? size.width * 0.1
                          : size.width * 0.06,
            ),
            sliver: SliverStaggeredGrid.countBuilder(
              addAutomaticKeepAlives: false,
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (BuildContext context, int index) {
                int lastDigit = index % 10;
                if (list[index].type == "thumbnail") {
                  return ImageCard(
                    pic: list[index].source,
                    startAnimation: startAnimation,
                    video: true,
                    press: () {
                      context
                          .read<VideoProfileCubit>()
                          .getVideo(convertToMP4(list[index].name));
                      showDialog(
                        context: context,
                        builder: (context) {
                          return BlocBuilder<VideoProfileCubit,
                              VideoProfileState>(
                            builder: (context, state) {
                              if (state is VideoProfileLoadingState) {
                                return const DialogLoading();
                              } else if (state is GetVideoProfileState) {
                                return DialogVideo(
                                  sourceImg: list[index].source,
                                  source: state.video.source,
                                );
                              }
                              return const DialogLoading();
                            },
                          );
                        },
                      );
                    },
                  );
                }
                return ImageCard(
                  pic: list[index].source,
                  startAnimation: startAnimation,
                );
              },
              itemCount: list.length,
              staggeredTileBuilder: (int index) {
                int lastDigit = index % 10;
                if (lastDigit == 2 || lastDigit == 5) {
                  return const StaggeredTile.count(1, 2);
                }
                return const StaggeredTile.count(1, 1);
              },
            ),
          );
        }
        return SliverToBoxAdapter(
          child: gridSystemMyApp(
            context,
            [
              item100(
                context,
                false,
                widget: Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}

String convertToMP4(String filename) {
  if (filename.endsWith('.png') ||
      filename.endsWith('.PNG') ||
      filename.endsWith('.jpg') ||
      filename.endsWith('.JPG')) {
    return filename.replaceAll(RegExp(r'\.[^.]*$'), '.mp4');
  }
  return filename;
}

class DialogVideo extends StatefulWidget {
  const DialogVideo({
    super.key,
    required this.source,
    required this.sourceImg,
  });

  final String source;
  final String sourceImg;

  @override
  State<DialogVideo> createState() => _DialogVideoState();
}

class _DialogVideoState extends State<DialogVideo> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.source)
      ..addListener(() {})
      ..setLooping(true)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      child: _controller.value.isInitialized
          ? Container(
              width: MyResponsive.isDesktop(context) ? size.width * 0.6 : null,
              color: kTextColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              SizedBox(child: VideoPlayer(_controller)),
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
                                      decoration: BoxDecoration(
                                        color: _controller.value.isPlaying
                                            ? null
                                            : kSecondaryColor.withOpacity(0.4),
                                      ),
                                      child: Center(
                                        child: _controller.value.isPlaying
                                            ? Container()
                                            : IconButton(
                                                iconSize: 50,
                                                onPressed: () {
                                                  setState(() {
                                                    _controller.value.isPlaying
                                                        ? _controller.pause()
                                                        : _controller.play();
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .play_circle_outline_rounded,
                                                  color: kTextColor,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!MyResponsive.isMobile(context))
                          Expanded(
                              child: Container(
                            child: Text(
                              "Doing",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      ],
                    ),
                  ),
                  if (MyResponsive.isMobile(context))
                    Expanded(
                        child: Container(
                      child: Text(
                        "Doing",
                        style: TextStyle(color: Colors.black),
                      ),
                    )),
                ],
              ),
            )
          : Container(
              width: MyResponsive.isDesktop(context) ? size.width * 0.6 : null,
              color: kTextColor,
            ),
    );
  }
}

class DialogLoading extends StatelessWidget {
  const DialogLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: SizedBox(
        width: 200,
        height: 200,
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
