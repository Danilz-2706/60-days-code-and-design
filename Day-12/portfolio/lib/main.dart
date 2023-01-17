import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/app_router.dart';

import 'views/constans/colors.dart';

void main(List<String> args) {
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(),
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: (routeInformation, _) => MainLocation(routeInformation),
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DMSans',
        scaffoldBackgroundColor: kBgDarkColor,
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
