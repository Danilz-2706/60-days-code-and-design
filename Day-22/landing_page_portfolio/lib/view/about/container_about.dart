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
    return BlocBuilder<ImageVideoProfileCubit, ImageVideoProfileState>(
      builder: (context, state) {
        if (state is ImageVideoLoading) {
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
        } else if (state is ImageVideoLoaded) {
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
                if (lastDigit == 2 || lastDigit == 5) {
                  return ImageCard(
                    pic: list[index],
                    startAnimation: startAnimation,
                    video: true,
                    press: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogVideo();
                        },
                      );
                    },
                  );
                }
                return ImageCard(
                  pic: list[index],
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

class DialogVideo extends StatefulWidget {
  const DialogVideo({
    super.key,
  });

  @override
  State<DialogVideo> createState() => _DialogVideoState();
}

class _DialogVideoState extends State<DialogVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/my-portfolio-ac4c6.appspot.com/o/profile%2Fvideo%2FSequence%2003.mp4?alt=media&token=52f1b1f1-6e96-4850-b735-e07b2ae19f46&fbclid=IwAR1ru_idCHa3UCDVVtn0hD84OWMds76L-K27PvzNUCEAkKZG7yKVZOJvs8U')
      ..initialize().then((_) {
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
    return Dialog(
      child: _controller.value.isInitialized
          ? Container(
              child: Stack(
                children: [
                  Container(child: VideoPlayer(_controller)),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
