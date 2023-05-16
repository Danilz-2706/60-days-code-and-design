import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../components/big_title.dart';
import '../components/footer.dart';
import '../constans/grid_system.dart';
import '../constans/spacing.dart';
import 'components/for_about_me.dart';
import 'components/my_social.dart';
import 'components/project_fav.dart';
import 'components/see_all_work.dart';

class ContainerHome extends StatefulWidget {
  const ContainerHome({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerHome> createState() => _ContainerHomeState();
}

class _ContainerHomeState extends State<ContainerHome> {
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
        child: gridSystemMyApp(
          context,
          [
            BigTitle(
                context: context,
                title: "Product Design",
                startAnimation: startAnimation),

            //Item to About me
            item50(
              context,
              false,
              widget: ForAboutMe(
                startAnimation: startAnimation,
                leftAnimation: 0,
                rightAnimation: 0,
                topAnimation: -kDefaultHeigthComponent,
              ),
            ),

            //Item to project detail
            projectFav(
              context,
              startAnimation,
              leftAnimation: 0,
              rightAnimation: 0,
              bottomAnimation: -kDefaultHeigthComponent,
            ),

            //Item to see all work
            seeAllWork(
              context,
              startAnimation,
              rightAnimation: -kDefaultHeigthComponent,
              leftAnimation: kDefaultHeigthComponent,
            ),

            // Item to my social
            mySocial(
              context,
              startAnimation,
              rightAnimation: kDefaultHeigthComponent,
              leftAnimation: -kDefaultHeigthComponent,
            ),

            item100(
              context,
              false,
              widget: const Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
