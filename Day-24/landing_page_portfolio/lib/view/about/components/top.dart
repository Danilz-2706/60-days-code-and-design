import 'package:flutter/material.dart';

import '../../components/big_title.dart';
import '../../constans/grid_system.dart';
import '../../constans/responsive.dart';
import '../../constans/spacing.dart';
import 'build_about_image.dart';
import 'text_about_me.dart';
import 'welcome.dart';

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
