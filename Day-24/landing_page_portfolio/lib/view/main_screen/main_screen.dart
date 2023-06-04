import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../controller/cubits/cubit_export.dart';
import '../components/header.dart';
import '../constans/app_router.dart';
import 'side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final beamerKey = GlobalKey<BeamerState>();

    return Scaffold(
      key: context.read<MenuAppControllerCubit>().scaffoldKey,
      drawer: SideMenu(
        beamer: beamerKey,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(
              beamer: beamerKey,
            ),
            if ((context.currentBeamLocation.state as BeamState)
                .uri
                .path
                .isEmpty)
              const Center(
                child: Text(
                  'No Data',
                  style: TextStyle(color: Colors.white, fontSize: 100),
                ),
              )
            else
              Expanded(
                child: Beamer(
                  key: beamerKey,
                  routerDelegate: BeamerDelegate(
                    locationBuilder: (routeInformation, beamParameters) {
                      return routeInformation.location!.contains('works')
                          ? WorkLocation(routeInformation)
                          : routeInformation.location!.contains('about-me')
                              ? AboutMeLocation(routeInformation)
                              : routeInformation.location!
                                      .contains('get-in-touch')
                                  ? GetInTouchLocation(routeInformation)
                                  : HomeLocation(routeInformation);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
