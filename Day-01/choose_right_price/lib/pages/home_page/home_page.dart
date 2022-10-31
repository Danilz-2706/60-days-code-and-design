import 'dart:math';

import 'package:flutter/material.dart';

import 'components/left_screen.dart';
import 'components/right_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Random x = Random();
    int random = x.nextInt(4);
    return Scaffold(
      body: Row(
        children: [
          LeftScreen(currentProduct: random),
          SizedBox(
            width: 1,
            child: Container(color: Colors.black26),
          ),
          RightScreen(currentProduct: random),
        ],
      ),
    );
  }
}
