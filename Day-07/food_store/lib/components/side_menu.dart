import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/blocs/cubit/side_menu_cubit.dart';
import 'package:food_store/models/food.dart';

import 'item_side_bar.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = fakeDataMenu;
    return SingleChildScrollView(
      child: BlocBuilder<SideMenuCubit, SideMenuState>(
        builder: (context, state) {
          return Column(
            children: [
              ...List.generate(
                list.length,
                (index) => ItemSideBar(
                  title: list[index].title,
                  icon: list[index].icon,
                  press: () {
                    BlocProvider.of<SideMenuCubit>(context).chooseMenu(index);
                  },
                  pressed: state.menu == index ? true : false,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
