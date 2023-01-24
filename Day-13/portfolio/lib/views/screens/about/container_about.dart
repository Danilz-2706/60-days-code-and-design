// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/views/components/big_title.dart';
import 'package:portfolio/views/constans/responsive.dart';

import '../../../controllers/blocs/profile/profile_bloc.dart';
import '../../../models/font-end/text_about.dart';
import '../../components/footer.dart';
import '../../components/text_card.dart';
import '../../constans/grid_system.dart';

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
    List<Pic> pic = [
      Pic("x", pic: "assets/images/avatar.png"),
      Pic("m", pic: "assets/images/avatar.png"),
      Pic("m", pic: "assets/images/avatar.png"),
      Pic("m", pic: "assets/images/avatar.png"),
      Pic("xl", pic: "assets/images/avatar.png"),
      Pic("xl", pic: "assets/images/avatar.png"),
      Pic("x", pic: "assets/images/avatar.png"),
      Pic("m", pic: "assets/images/avatar.png"),
      Pic("xl", pic: "assets/images/avatar.png"),
    ];
    return SingleChildScrollView(
      child: gridSystemMyApp(
        context,
        [
          BigTitle(context: context, title: "About me"),

          //Avatar
          if (MyResponsive.isDesktop(context))
            item75(
              context,
              image: "assets/images/avatar.png",
            ),
          if (MyResponsive.isTablet(context) || MyResponsive.isMobile(context))
            item50(
              context,
              image: "assets/images/avatar.png",
            ),
          if (MyResponsive.isDesktop(context))
            item25(
              context,
              widget: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedState) {
                    var data = state.profile;
                    return TextCard(
                      overFlow: false,
                      listTextAbout: [
                        TextAbout(
                          heading: Heading.header,
                          header: "Hi, I'm ${data.name}",
                          myFontsize: 36,
                        ),
                        TextAbout(
                          heading: Heading.text,
                          text: "Product Designer",
                          myFontsize: 24,
                        ),
                      ],
                    );
                  } else {
                    return const Text("Error");
                  }
                },
              ),
            ),
          if (MyResponsive.isTablet(context))
            item50(
              context,
              widget: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedState) {
                    var data = state.profile;
                    return TextCard(
                      overFlow: false,
                      listTextAbout: [
                        TextAbout(
                          heading: Heading.header,
                          header: "Hi, I'm ${data.name}",
                          myFontsize: 36,
                        ),
                        TextAbout(
                          heading: Heading.text,
                          text: "Product Designer",
                          myFontsize: 24,
                        ),
                      ],
                    );
                  } else {
                    return const Text("Error");
                  }
                },
              ),
            ),

          //Profile
          item100(
            context,
            widget: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedState) {
                  var data = state.profile;

                  return TextCard(
                    overFlow: true,
                    listTextAbout: [
                      TextAbout(heading: Heading.header, header: "About Me"),
                      TextAbout(heading: Heading.text, text: data.aboutMe),
                    ],
                  );
                } else {
                  return const Text("Error");
                }
              },
            ),
          ),

          //My Picture
          ...List.generate(
            pic.length,
            (index) {
              if (pic[index].size == "m") {
                return item25(
                  context,
                  image: "assets/images/avatar.png",
                );
              }
              if (pic[index].size == "x") {
                return item50(
                  context,
                  image: "assets/images/avatar.png",
                );
              }
              if (pic[index].size == "xl") {
                return item75(
                  context,
                  image: "assets/images/avatar.png",
                );
              } else {
                return item100(
                  context,
                  image: "assets/images/avatar.png",
                );
              }
            },
          ),
          item100(
            context,
            widget: const Footer(),
          ),
        ],
      ),
    );
  }
}
