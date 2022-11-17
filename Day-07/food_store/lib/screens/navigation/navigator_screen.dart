import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/blocs/cubit/side_menu_cubit.dart';
import 'package:food_store/screens/home/home_screen.dart';
import 'package:food_store/screens/menu/menu_screen.dart';

import '../../components/side_menu.dart';
import '../../constants/spacing.dart';

class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 44, 44, 44),
          child: Row(
            children: [
              const SideMenu(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding / 1.5,
                      right: kDefaultPadding / 1.5,
                      top: kDefaultPadding),
                  child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: BlocBuilder<SideMenuCubit, SideMenuState>(
                      builder: (context, state) {
                        print(state.menu.toString());
                        if (state.menu == 0) {
                          return const HomeScreen();
                        }
                        if (state.menu == 1) {
                          return const MenuScreen();
                        } else {
                          return Container(
                            color: Colors.yellow,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
