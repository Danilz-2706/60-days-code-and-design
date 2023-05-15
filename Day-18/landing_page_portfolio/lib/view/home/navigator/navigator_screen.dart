import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:landing_page_portfolio/view/constans/app_router.dart';

class NavigaBeamer extends StatelessWidget {
  const NavigaBeamer({super.key});

  @override
  Widget build(BuildContext context) {
    final beamerKey = GlobalKey<BeamerState>();

    return Beamer(
      key: beamerKey,
      routerDelegate: BeamerDelegate(
        locationBuilder: (routeInformation, beamParameters) {
          return routeInformation.location!.contains('portfolio')
              ? MainLocation(routeInformation)
              : LandingPageLocation(routeInformation);
        },
      ),
    );
  }
}
