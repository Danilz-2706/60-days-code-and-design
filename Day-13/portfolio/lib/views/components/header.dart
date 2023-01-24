// ignore_for_file: avoid_print

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

import '../../controllers/blocs/profile/profile_bloc.dart';
import '../../controllers/blocs/work/work_bloc.dart';
import '../constans/colors.dart';
import '../constans/grid_system.dart';
import '../constans/responsive.dart';
import 'btn_detail.dart';
import 'menu_title.dart';

class Header extends StatefulWidget {
  const Header({
    required this.beamer,
    Key? key,
  }) : super(key: key);

  final GlobalKey<BeamerState> beamer;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => widget
        .beamer.currentState?.routerDelegate
        .addListener(_setStateListener));
  }

  @override
  void dispose() {
    widget.beamer.currentState?.routerDelegate
        .removeListener(_setStateListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return gridSystemMyApp(
      context,
      [
        item100(context,
            widget: SizedBox(
              height: !MyResponsive.isMobile(context) ? 4 : 1,
            )),
        avatar(context),
        if (size < 1100 && size > 852)
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            columnSpan: const ColumnSpan.size(2),
            child: Container(color: Colors.transparent),
          ),
        if (size <= 852 && size >= 750)
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            columnSpan: const ColumnSpan.size(1),
            child: Container(color: Colors.transparent),
          ),
        menu(context),
        item100(context),
      ],
    );
  }

  ResponsiveLayoutCell menu(BuildContext context) {
    return ResponsiveLayoutCell(
      position: CellPosition.nextColumn(),
      columnSpan: ColumnSpan.size(
        MyResponsive.isDesktop(context)
            ? 8
            : MyResponsive.isTablet(context)
                ? 4
                : 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!MyResponsive.isMobile(context))
            Row(
              children: [
                MenuTitle(
                  press: () {
                    widget.beamer.currentState?.routerDelegate
                        .beamToNamed('/works');
                    context.read<WorkBloc>().add(GetAllWorkEvent());
                  },
                  title: "Work",
                  color: kMenuTextColor,
                ),
                SizedBox(width: MyResponsive.isTablet(context) ? 10 : 20),
                MenuTitle(
                  press: () {
                    widget.beamer.currentState?.routerDelegate
                        .beamToNamed('/about-me');
                    print("about-me");
                  },
                  title: "About",
                  color: kMenuTextColor,
                ),
                SizedBox(width: MyResponsive.isTablet(context) ? 10 : 20),
                MenuTitle(
                  press: () {},
                  title: "Resume",
                  color: kMenuTextColor,
                ),
                SizedBox(width: MyResponsive.isTablet(context) ? 20 : 40),
                BtnDetail(
                  title: "Get in touch",
                  color: kTextColor,
                  press: () {
                    widget.beamer.currentState?.routerDelegate
                        .beamToNamed('/get-in-touch');
                    print("getintouch");
                  },
                ),
              ],
            ),
          if (MyResponsive.isMobile(context))
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: kMenuTextColor,
                    )),
              ],
            ),
        ],
      ),
    );
  }

  ResponsiveLayoutCell avatar(BuildContext context) {
    return ResponsiveLayoutCell(
      position: CellPosition.nextRow(),
      columnSpan: ColumnSpan.size(
        MyResponsive.isDesktop(context)
            ? 4
            : MyResponsive.isTablet(context)
                ? 2
                : 2,
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          print(state);
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            final data = state.profile;
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed('/');
                      // ignore:
                      print("home");
                    },
                    child: Container(
                      width: MyResponsive.isDesktop(context) ? 50 : 42,
                      height: MyResponsive.isDesktop(context) ? 50 : 42,
                      decoration: const BoxDecoration(
                          gradient: kPrimaryColor, shape: BoxShape.circle),
                    ),
                  ),
                  MenuTitle(
                    press: () {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed('/');
                      // ignore:
                      print("home");
                    },
                    title: data.name,
                    color: kMenuTextColor,
                  ),
                ],
              ),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
