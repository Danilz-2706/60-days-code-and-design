import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';
import 'package:rive/rive.dart';

import '../../../controller/cubits/cubit_export.dart';
import '../../../model/back_end/work.dart';
import '../../../model/font-end/animated_positioned.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';
import '../../constans/responsive.dart';
import '../../constans/spacing.dart';

class ListWork extends StatelessWidget {
  const ListWork({
    Key? key,
    required this.startAnimation,
  }) : super(key: key);
  final bool startAnimation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkCubit, WorkState>(
      builder: (context, state) {
        if (state is WorkLoading) {
          return const SizedBox(
            height: 280,
            child: RiveAnimation.asset("assets/animations/anima_reply-ing.riv"),
          );
        } else if (state is WorkLoaded) {
          var data = state.listWork;
          return SingleChildScrollView(
            child: gridSystemMyApp(
              context,
              [
                ...List.generate(
                  data.length,
                  (index) {
                    if (data[index].nameType == "${TypeApp.ios}" ||
                        data[index].nameType == "${TypeApp.android}") {
                      return _itemForApp(
                        context,
                        data,
                        index,
                        startAnimation,
                        rightAnimation: kDefaultHeigthComponent *
                            (index % 2 == 0 ? 1.0 : -1.0),
                        leftAnimation: kDefaultHeigthComponent *
                            (index % 2 == 0 ? -1.0 : 1.0),
                      );
                    } else if (data[index].nameType == "${TypeApp.web}") {
                      return _itemForWeb(
                        context,
                        data,
                        index,
                        startAnimation,
                        rightAnimation: 0,
                        topAnimation:
                            index % 2 == 0 ? -kDefaultHeigthComponent : null,
                        bottomAnimation:
                            index % 2 != 0 ? -kDefaultHeigthComponent : null,
                        leftAnimation: 0,
                      );
                    }
                    return item100(
                      context,
                      false,
                    );
                  },
                ),
              ],
            ),
          );
        }
        return const Text(
          "Error",
          style: TextStyle(color: kTextColor),
        );
      },
    );
  }

  ResponsiveLayoutCell _itemForApp(
    BuildContext context,
    List<Work> data,
    int index,
    bool startAnimation, {
    double? leftAnimation,
    double? bottomAnimation,
    double? rightAnimation,
    double? topAnimation,
  }) {
    return item25(
      context,
      startAnimation,
      leftAnimation: leftAnimation,
      rightAnimation: rightAnimation,
      bottomAnimation: bottomAnimation,
      topAnimation: topAnimation,
      list: [
        MyAnimatedPositioned(
          type: Type.text,
          topb: !MyResponsive.isTablet(context) ? 12 : 30,
          topa: !MyResponsive.isTablet(context) ? 16 : 34,
          duration: const Duration(milliseconds: 260),
          fontsizeb: !MyResponsive.isTablet(context) ? 18 : 22,
          fontsizea: 22,
          colorb: kTextColor,
          colora: Colors.transparent,
          textb: "Android App",
          texta: data[index].nameWork,
        ),
        if (!MyResponsive.isTablet(context))
          MyAnimatedPositioned(
            type: Type.text,
            topb: 40,
            topa: 44,
            duration: const Duration(milliseconds: 260),
            fontsizeb: 26,
            fontsizea: 28,
            colorb: kTextColor,
            colora: Colors.transparent,
            textb: data[index].nameWork,
            texta: "View The Case Study",
          ),
        MyAnimatedPositioned(
          type: Type.picture,
          align: MyAlign.center,
          imagewidthb: 130,
          imagewidtha: !MyResponsive.isTablet(context) ? 170 : 140,
          imagehightb: !MyResponsive.isTablet(context) ? 160 : 170,
          imagehighta: 160,
          bottomb: 0,
          bottoma: !MyResponsive.isTablet(context) ? -40 : -10,
          duration: const Duration(milliseconds: 260),
          image: "assets/images/avatar.png",
        )
      ],
      press: () {
        context.beamToNamed('/portfolio/works/${data[index].workId}');
      },
    );
  }

  ResponsiveLayoutCell _itemForWeb(
    BuildContext context,
    List<Work> data,
    int index,
    bool startAnimation, {
    double? leftAnimation,
    double? bottomAnimation,
    double? rightAnimation,
    double? topAnimation,
  }) {
    return item50(
      context,
      startAnimation,
      leftAnimation: leftAnimation,
      rightAnimation: rightAnimation,
      bottomAnimation: bottomAnimation,
      topAnimation: topAnimation,
      list: [
        MyAnimatedPositioned(
          type: Type.text,
          topb: 12,
          topa: 20,
          duration: const Duration(milliseconds: 260),
          fontsizeb: 18,
          fontsizea: 22,
          colorb: kTextColor,
          colora: Colors.transparent,
          textb: "Web design",
          texta: data[index].nameWork,
        ),
        MyAnimatedPositioned(
          type: Type.text,
          topb: 40,
          topa: 48,
          duration: const Duration(milliseconds: 260),
          fontsizeb: 26,
          fontsizea: 30,
          colorb: kTextColor,
          colora: Colors.transparent,
          textb: data[index].nameWork,
          texta: "View The Case Study",
        ),
        MyAnimatedPositioned(
          type: Type.picture,
          align: MyAlign.center,
          imagewidthb: 220,
          imagewidtha: 260,
          imagehightb: 160,
          imagehighta: 160,
          bottomb: 0,
          bottoma: -20,
          duration: const Duration(milliseconds: 260),
          image: "assets/images/avatar.png",
        )
      ],
      press: () {
        context.beamToNamed('/portfolio/works/${data[index].workId}');
      },
    );
  }
}
