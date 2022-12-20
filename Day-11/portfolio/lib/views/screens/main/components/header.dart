import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/responsive.dart';
import 'package:responsive_ui/responsive_ui.dart';

import '../../../components/btn_detail.dart';
import '../../../constans/colors.dart';
import 'menu_title.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      crossAxisAlignment: WrapCrossAlignment.center,
      // runAlignment: WrapAlignment.end,
      children: [
        Div(
          divison: const Division(
            colXL: 3,
            // offsetXL: 1,
            colL: 4,
            colM: 3,
            colS: 6,
            // offsetL: 1,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: Responsive1.isDesktop(context) ? 50 : 42,
                height: Responsive1.isDesktop(context) ? 50 : 42,
                decoration: const BoxDecoration(
                    gradient: kPrimaryColor, shape: BoxShape.circle),
              ),
              MenuTitle(
                press: () {},
                title: "Danilz Dinh",
                color: kMenuTextColor,
              ),
            ],
          ),
        ),
        if (!Responsive1.isMobile(context))
          Div(
            divison: const Division(
              colXL: 5,
              colL: 6,
              colM: 7,
              colS: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MenuTitle(
                  press: () {},
                  title: "Work",
                  color: kMenuTextColor,
                ),
                SizedBox(width: Responsive1.isTablet(context) ? 10 : 20),
                MenuTitle(
                  press: () {},
                  title: "About",
                  color: kMenuTextColor,
                ),
                SizedBox(width: Responsive1.isTablet(context) ? 10 : 20),
                MenuTitle(
                  press: () {},
                  title: "Resume",
                  color: kMenuTextColor,
                ),
                SizedBox(width: Responsive1.isTablet(context) ? 20 : 40),
                BtnDetail(
                  title: "Get in touch",
                  color: kTextColor,
                  press: () {},
                ),
              ],
            ),
          ),
        if (Responsive1.isMobile(context))
          Div(
            divison: const Division(colS: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: kMenuTextColor,
                    )),
              ],
            ),
          )
      ],
    );
  }
}
