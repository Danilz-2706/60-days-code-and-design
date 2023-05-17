// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:landing_page_portfolio/view/constans/spacing.dart';
import 'package:rive/rive.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../controller/cubits/cubit_export.dart';
import '../components/big_title.dart';
import '../components/footer.dart';
import '../components/image_card.dart';
import '../constans/grid_system.dart';
import '../constans/responsive.dart';
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
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            gridSystemMyApp(
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

                if (MyResponsive.isTablet(context) ||
                    MyResponsive.isMobile(context))
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
                if (MyResponsive.isTablet(context) ||
                    MyResponsive.isMobile(context))
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
            const ListImageProfile(),
            gridSystemMyApp(
              context,
              [
                item100(
                  context,
                  false,
                  widget: const Footer(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildAbout extends StatelessWidget {
  const BuildAbout({
    super.key,
    required this.startAnimation,
    this.leftAnimation,
    this.bottomAnimation,
    this.rightAnimation,
    this.topAnimation,
  });

  final bool startAnimation;
  final double? leftAnimation;
  final double? bottomAnimation;
  final double? rightAnimation;
  final double? topAnimation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const SizedBox(
            height: 280,
            child: RiveAnimation.asset("assets/animations/anima_reply-ing.riv"),
          );
        } else if (state is ProfileLoaded) {
          return ImageCard(
            pic: state.profile.avatar,
            size: kDefaultHeigthComponent,
            startAnimation: startAnimation,
            leftAnimation: leftAnimation,
            bottomAnimation: bottomAnimation,
            rightAnimation: rightAnimation,
            topAnimation: topAnimation,
          );
        }
        return Container();
      },
    );
  }
}
