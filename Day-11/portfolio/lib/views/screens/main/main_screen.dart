import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/colors.dart';

import '../../components/btn_detail.dart';
import '../../constans/responsive.dart';
import 'components/big_title.dart';
import 'components/header.dart';
import 'components/menu_title.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          const BigTitle(
            title: "Product Designer",
          ),
          Row(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ],
      ),
    );
  }
}
