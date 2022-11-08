import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_store/constants/spacing.dart';

import '../../components/item_side_bar.dart';
import '../../components/side_menu.dart';
import 'components/body_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: const [
            SideMenu(),
            Expanded(
              child: BodyHomeScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
