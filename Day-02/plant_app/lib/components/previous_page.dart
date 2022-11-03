import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/spacing.dart';

class PreviousPage extends StatelessWidget {
  const PreviousPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
      ),
    );
  }
}
