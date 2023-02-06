// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/views/components/big_title.dart';
import 'package:portfolio/views/constans/responsive.dart';

import '../../../controllers/blocs/bloc_exports.dart';
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

              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is LoadingProfileState) {
                    return const CircularProgressIndicator();
                  } else if (state is LoadedProfileState) {
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
