import 'package:flutter/material.dart';
import 'package:task_list_app/models/fake_data.dart';

import 'drawer_title_list.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  static var listMenu = listDataMenu;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset("assets/images/logo.png")),
            ListView.builder(
              shrinkWrap: true,
              itemCount: listMenu.length,
              itemBuilder: (context, index) => DrawerTitleList(
                icon: listMenu[index].icon,
                title: listMenu[index].name,
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
