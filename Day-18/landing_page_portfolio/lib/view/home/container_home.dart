import 'package:flutter/material.dart';

import '../components/big_title.dart';
import '../components/footer.dart';
import '../constans/grid_system.dart';
import 'components/for_about_me.dart';
import 'components/my_social.dart';
import 'components/project_fav.dart';
import 'components/see_all_work.dart';

class ContainerHome extends StatelessWidget {
  const ContainerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: gridSystemMyApp(
        context,
        [
          BigTitle(context: context, title: "Product Design"),

          //Item to About me
          item50(
            context,
            widget: const ForAboutMe(),
          ),

          //Item to project detail
          projectFav(context),

          //Item to see all work
          seeAllWork(context),

          // Item to my social
          mySocial(context),
          item100(
            context,
            widget: const Footer(),
          ),
        ],
      ),
    );
  }
}
