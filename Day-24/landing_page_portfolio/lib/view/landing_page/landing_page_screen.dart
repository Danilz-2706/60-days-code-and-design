import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:landing_page_portfolio/view/constans/spacing.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../constans/responsive.dart';
import 'components/page_item.dart';
import 'components/social_item.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  late ScrollController scrollController;

  late Timer _timer;
  int currentPage = 0;
  int pageIndex = 0;
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    _pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.8);
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInToLinear,
      );
    });
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
    _timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: WebSmoothScroll(
          controller: scrollController,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MyResponsive.isDesktop(context)
                    ? kDefaultPadding * 3
                    : MyResponsive.isDesktop(context)
                        ? 12
                        : 20,
                vertical: MyResponsive.isDesktop(context)
                    ? kDefaultPadding
                    : MyResponsive.isDesktop(context)
                        ? 12
                        : 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MyResponsive.isDesktop(context)
                            ? 650
                            : MyResponsive.isMobile(context)
                                ? 400
                                : size.width >= 708
                                    ? 450
                                    : 390,
                        height: MyResponsive.isDesktop(context)
                            ? 850
                            : MyResponsive.isMobile(context)
                                ? 500
                                : size.width >= 708
                                    ? 650
                                    : 560,
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              right: startAnimation
                                  ? 0
                                  : MyResponsive.isDesktop(context)
                                      ? -650
                                      : MyResponsive.isMobile(context)
                                          ? -400
                                          : size.width >= 708
                                              ? -450
                                              : -390,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 800),
                              child: SizedBox(
                                width: MyResponsive.isDesktop(context)
                                    ? 650
                                    : MyResponsive.isMobile(context)
                                        ? 400
                                        : size.width >= 708
                                            ? 450
                                            : 390,
                                height: MyResponsive.isDesktop(context)
                                    ? 850
                                    : MyResponsive.isMobile(context)
                                        ? 500
                                        : size.width >= 708
                                            ? 650
                                            : 560,
                                child: AspectRatio(
                                  aspectRatio: 0.8,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return carouselView(index);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!MyResponsive.isMobile(context))
                        Expanded(
                          child: SocialItem(startAnimation: startAnimation),
                        ),
                    ],
                  ),
                  if (MyResponsive.isMobile(context))
                    SocialItem(startAnimation: startAnimation),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(),
        );
      },
    );
  }

  Widget carouselCard() {
    return PageItem(pageIndex: pageIndex);
  }
}
