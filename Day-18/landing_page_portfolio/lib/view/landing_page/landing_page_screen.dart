import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:landing_page_portfolio/view/constans/spacing.dart';

import '../../model/fake_data.dart';
import '../constans/responsive.dart';
import 'components/item_social.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  late Timer _timer;
  int currentPage = 0;
  int pageIndex = 0;
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
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
          child: SingleChildScrollView(
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
      )),
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
          print("value $value index $index");
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

class SocialItem extends StatelessWidget {
  const SocialItem({
    super.key,
    required this.startAnimation,
  });

  final bool startAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        child: Wrap(
          children: List.generate(
            list_social.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemSocial(
                  startAnimation: startAnimation,
                  positionY: -60,
                  icon: list_social[index]['icon']!,
                  title: list_social[index]['title']!,
                  link: list_social[index]['link']!,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  const PageItem({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Hero(
        tag: "assets/images/avatar.png",
        child: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(MyResponsive.isMobile(context)
                ? 4
                : MyResponsive.isDesktop(context)
                    ? 20
                    : 8),
            decoration: BoxDecoration(
              color: pageIndex == 3 ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("assets/images/avatar.png"),
                  fit: BoxFit.fill),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 4, color: Colors.black26)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
