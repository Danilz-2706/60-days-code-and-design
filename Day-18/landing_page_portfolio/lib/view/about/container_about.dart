// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../controller/cubits/cubit_export.dart';
import '../components/big_title.dart';
import '../components/footer.dart';
import '../constans/grid_system.dart';
import '../constans/responsive.dart';
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

              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ProfileLoaded) {
                    if (MyResponsive.isDesktop(context)) {
                      return item75(
                        context,
                        image: state.profile.avatar,
                        sizeImage: 280,
                      );
                    }
                    if (MyResponsive.isTablet(context) ||
                        MyResponsive.isMobile(context)) {
                      return item50(
                        context,
                        image: state.profile.avatar,
                        sizeImage: 280,
                      );
                    }
                  } else {
                    return Container();
                  }
                  return Container();
                },
              ),
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
