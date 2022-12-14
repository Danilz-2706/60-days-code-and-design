import 'package:flutter/material.dart';
import 'package:task_list_app/controller/blocs/bloc_exports.dart';
import 'package:task_list_app/models/fake_data.dart';

import '../../../components/drawer_title_list.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listMenu = listDataMenu;

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset("assets/images/logo.png")),
            ...List.generate(
              listMenu.length,
              (index) => DrawerTitleList(
                title: listMenu[index].name,
                icon: listMenu[index].icon,
                press: () {
                  context
                      .read<NavigatorMenuBloc>()
                      .add(ClickMenuEvent(indexMenu: index));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
