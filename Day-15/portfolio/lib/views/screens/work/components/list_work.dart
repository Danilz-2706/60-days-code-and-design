import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

import '../../../../controllers/blocs/work/work_bloc.dart';
import '../../../../controllers/services/firestore_service/work.dart';
import '../../../../models/back_end/work.dart';
import '../../../../models/font-end/animated_positioned.dart';
import '../../../constans/colors.dart';
import '../../../constans/grid_system.dart';
import '../../../constans/responsive.dart';

class ListWork extends StatelessWidget {
  const ListWork({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkBloc>(
      create: (context) =>
          WorkBloc(workService: RepositoryProvider.of<WorkService>(context))
            ..add(GetAllWorkEvent()),
      child: BlocBuilder<WorkBloc, WorkState>(
        builder: (context, state) {
          if (state is LoadingWorkState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllWorkState) {
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
                        return _itemForApp(context, data, index);
                      } else if (data[index].nameType == "${TypeApp.web}") {
                        return _itemForWeb(context, data, index);
                      }
                      return item100(context);
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
      ),
    );
  }

  ResponsiveLayoutCell _itemForApp(
      BuildContext context, List<Work> data, int index) {
    return item25(
      context,
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
        context.beamToNamed('/works/${data[index].workId}');
      },
    );
  }

  ResponsiveLayoutCell _itemForWeb(
      BuildContext context, List<Work> data, int index) {
    return item50(
      context,
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
        context.beamToNamed('/works/${data[index].workId}');
      },
    );
  }
}
