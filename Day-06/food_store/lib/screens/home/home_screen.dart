import 'package:flutter/material.dart';

import '../../components/side_menu.dart';
import 'components/body_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 44, 44, 44),
          child: Row(
            children: const [
              SideMenu(),
              Expanded(
                child: BodyHomeScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
