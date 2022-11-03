import 'package:flutter/material.dart';

import '../../../components/more_button.dart';
import '../../../components/title_with_underline.dart';
import '../../../constants/color.dart';
import '../../../constants/spacing.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          TitleWithUnderline(
            text: text1,
            underineColor: kPrimaryColor,
            spacing: kDefaultPadding,
          ),
          const Spacer(),
          MoreButton(
            text: text2,
            colorbutton: kPrimaryColor,
            press: () {},
          ),
        ],
      ),
    );
  }
}
