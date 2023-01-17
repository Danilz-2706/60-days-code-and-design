import 'package:flutter/material.dart';

import '../../components/big_title.dart';
import '../../components/footer.dart';
import '../../components/menu_title.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';
import '../../constans/spacing.dart';
import 'my_form_field.dart';

class ContainerGetInTouch extends StatelessWidget {
  const ContainerGetInTouch({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: gridSystemMyApp(
        context,
        [
          const BigTitle(title: "Get in touch"),
          item50(
            context,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Get in Touch",
                  style: TextStyle(fontSize: 40, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding),
                const Text(
                  "Are you looking for a UX/UI designer to help with your next project?",
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding),
                const Text(
                  "I'd love to hear from you! Whether it's for a charity event, conceptual project or anything in relation to UX and UI I can help! Just contact me on this form or email below and let's start collaborating!",
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding),
                const GradientText(
                  text: "WANT TO CALL ME?",
                  gradient: kPrimaryColor,
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "0708391537",
                      style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                const GradientText(
                  text: "JUST WANT TO EMAIL ME?",
                  gradient: kPrimaryColor,
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "tandat27062000@gmail.com",
                      style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
          item50(
            context,
            widget: const MyFormField(),
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
