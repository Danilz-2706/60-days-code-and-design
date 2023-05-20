// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:landing_page_portfolio/view/constans/spacing.dart';
import 'package:rive/rive.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../controller/cubits/cubit_export.dart';
import '../components/big_title.dart';
import '../components/footer.dart';
import '../components/image_card.dart';
import '../constans/grid_system.dart';
import '../constans/responsive.dart';
import 'components/build_about_image.dart';
import 'components/list_image_profile.dart';
import 'components/text_about_me.dart';
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
          Bot(),
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

class Bot extends StatelessWidget {
  const Bot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    super.key,
    required this.startAnimation,
  });

  final bool startAnimation;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: gridSystemMyApp(
        context,
        [
          BigTitle(
              context: context,
              title: "About me",
              startAnimation: startAnimation),
          if (MyResponsive.isDesktop(context))
            item75(
              context,
              startAnimation,
              widget: BuildAbout(
                startAnimation: startAnimation,
                leftAnimation: 0,
                rightAnimation: 0,
                topAnimation: -kDefaultHeigthComponent,
              ),
            ),
          if (MyResponsive.isTablet(context) || MyResponsive.isMobile(context))
            item50(
              context,
              startAnimation,
              widget: BuildAbout(
                startAnimation: startAnimation,
                leftAnimation: 0,
                rightAnimation: 0,
                topAnimation: -kDefaultHeigthComponent,
              ),
            ),
          if (MyResponsive.isDesktop(context))
            item25(
              context,
              startAnimation,
              widget: Welcome(
                startAnimation: startAnimation,
                leftAnimation: -kDefaultHeigthComponent,
                rightAnimation: kDefaultHeigthComponent,
              ),
            ),
          if (MyResponsive.isTablet(context) || MyResponsive.isMobile(context))
            item50(
              context,
              startAnimation,
              widget: Welcome(
                startAnimation: startAnimation,
                leftAnimation: -kDefaultHeigthComponent,
                rightAnimation: kDefaultHeigthComponent,
              ),
            ),
          //Profile
          item100(
            context,
            startAnimation,
            leftAnimation: 0,
            rightAnimation: 0,
            topAnimation: -kDefaultHeigthComponent,
            widget: TextAboutMe(
              startAnimation: startAnimation,
            ),
          ),
        ],
      ),
    );
  }
}
