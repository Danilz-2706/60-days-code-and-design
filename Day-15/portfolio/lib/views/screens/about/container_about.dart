// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/views/components/big_title.dart';
import 'package:portfolio/views/constans/responsive.dart';

import '../../components/footer.dart';
import '../../constans/grid_system.dart';
import 'components/list_image_profile.dart';
import 'components/text_about_me.dart';
import 'components/welcome.dart';

class Pic {
  final String pic, size;
  Pic(
    this.size, {
    required this.pic,
  });
}

class ContainerAbout extends StatelessWidget {
  const ContainerAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          gridSystemMyApp(
            context,
            [
              BigTitle(context: context, title: "About me"),

              //Avatar
              if (MyResponsive.isDesktop(context))
                item75(context,
                    image: "assets/images/avatar.png", sizeImage: 280),
              if (MyResponsive.isTablet(context) ||
                  MyResponsive.isMobile(context))
                item50(context,
                    image: "assets/images/avatar.png", sizeImage: 280),
              if (MyResponsive.isDesktop(context))
                item25(
                  context,
                  widget: const Welcome(),
                ),
              if (MyResponsive.isTablet(context))
                item50(context, widget: const Welcome()),

              //Profile
              item100(
                context,
                widget: const TextAboutMe(),
              ),
            ],
          ),
          const ListImageProfile(),
          gridSystemMyApp(
            context,
            [
              item100(
                context,
                widget: const Footer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
