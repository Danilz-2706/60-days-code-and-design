import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'views/screens/main/main_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'DMSans',
          scaffoldBackgroundColor: kBgDarkColor,
        ),
        home: const MainScreen(),
      );
    });
  }
}
