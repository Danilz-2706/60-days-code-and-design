// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/views/components/big_title.dart';
import 'package:portfolio/views/constans/responsive.dart';

import '../../../models/font-end/text_about.dart';
import '../../components/footer.dart';
import '../../constans/grid_system.dart';

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
          const BigTitle(title: "About me"),
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
              overFlow: false,
              listTextAbout: [
                TextAbout(
                  heading: Heading.header,
                  header: "Hi, I'm Danilz",
                  myFontsize: 36,
                ),
                TextAbout(
                  heading: Heading.text,
                  text: "Product Designer",
                  myFontsize: 24,
                ),
              ],
            ),
          if (MyResponsive.isTablet(context))
            item50(
              context,
              overFlow: false,
              listTextAbout: [
                TextAbout(
                  heading: Heading.header,
                  header: "Hi, I'm Danilz",
                  myFontsize: 36,
                ),
                TextAbout(
                  heading: Heading.text,
                  text: "Product Designer",
                  myFontsize: 24,
                ),
              ],
            ),

          //Profile
          item100(
            context,
            overFlow: true,
            listTextAbout: [
              TextAbout(heading: Heading.header, header: "About Me"),
              TextAbout(
                  heading: Heading.text,
                  text:
                      "I'm a Product Designer with an emphasis on UI design and research. I love creating visual experiences that connect with people. When I work with clients, we work together as partners to reach goals and milestones. With a self-employed background in marketing and graphic design, I've helped dozens of clients double their Google review outputs and increase patient flow by improving their marketing materials."),
            ],
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

class Pic {
  final String pic, size;
  Pic(
    this.size, {
    required this.pic,
  });
}
