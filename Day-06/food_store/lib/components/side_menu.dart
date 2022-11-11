import 'package:flutter/material.dart';
import 'package:food_store/blocs/home_bloc.dart';
import 'package:food_store/models/food.dart';

import 'item_side_bar.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = fakeDataMenu;
    var bloc = HomeBloc();
    return SingleChildScrollView(
      child: StreamBuilder(
          stream: bloc.streamController,
          builder: (context, snapshot) {
            return Column(
              children: [
                ...List.generate(
                  list.length,
                  (index) => ItemSideBar(
                    title: list[index].title,
                    icon: list[index].icon,
                    press: () {
                      bloc.chooseMenu(index);
                    },
                    pressed: snapshot.data == index ? true : false,
                  ),
                )
              ],
            );
          }),
    );
  }
}
