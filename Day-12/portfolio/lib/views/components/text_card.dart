import 'package:flutter/material.dart';

import '../../models/font-end/text_about.dart';
import '../constans/colors.dart';
import '../constans/spacing.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    Key? key,
    required this.listTextAbout,
    this.overFlow,
  }) : super(key: key);

  final List<TextAbout> listTextAbout;
  final bool? overFlow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: overFlow == true ? null : 280,
      decoration: const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding + kDefaultPadding / 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            listTextAbout.length,
            (index) {
              if (listTextAbout[index].heading == Heading.header) {
                return Text(
                  "${listTextAbout[index].header}",
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: listTextAbout[index].myFontsize ?? 28,
                  ),
                );
              }
              if (listTextAbout[index].heading == Heading.text) {
                return Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    "${listTextAbout[index].text}",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: listTextAbout[index].myFontsize ?? 22,
                    ),
                  ),
                );
              }
              return const SizedBox(
                height: 0,
              );
            },
          ),
        ),
      ),
    );
  }
}
