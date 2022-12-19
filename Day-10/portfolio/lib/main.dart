import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views/screens/main/main_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'DMSans'),
      home: const MainScreen(),
    );
  }
}
