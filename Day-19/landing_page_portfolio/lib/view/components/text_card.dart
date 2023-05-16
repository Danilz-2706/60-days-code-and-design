import 'package:flutter/material.dart';

import '../../model/font-end/text_about.dart';
import '../constans/colors.dart';
import '../constans/spacing.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    Key? key,
    required this.listTextAbout,
    this.overFlow,
    required this.startAnimation,
    this.leftAnimation,
    this.bottomAnimation,
    this.rightAnimation,
    this.topAnimation,
  }) : super(key: key);

  final List<TextAbout> listTextAbout;
  final bool? overFlow;
  final bool startAnimation;
  final double? leftAnimation;
  final double? bottomAnimation;
  final double? rightAnimation;
  final double? topAnimation;

  @override
  Widget build(BuildContext context) {
    return overFlow == false
        ? SizedBox(
            height: kDefaultHeigthComponent,
            child: Stack(
              children: [
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 500),
                  left: startAnimation && leftAnimation != null
                      ? 0
                      : leftAnimation,
                  right: startAnimation && rightAnimation != null
                      ? 0
                      : rightAnimation,
                  top:
                      startAnimation && topAnimation != null ? 0 : topAnimation,
                  bottom: startAnimation && bottomAnimation != null
                      ? 0
                      : bottomAnimation,
                  child: Container(
                    height: kDefaultHeigthComponent,
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
                            if (listTextAbout[index].heading ==
                                Heading.header) {
                              return Text(
                                "${listTextAbout[index].header}",
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize:
                                      listTextAbout[index].myFontsize ?? 28,
                                ),
                              );
                            }
                            if (listTextAbout[index].heading == Heading.text) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: kDefaultPadding),
                                child: Text(
                                  "${listTextAbout[index].text}",
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize:
                                        listTextAbout[index].myFontsize ?? 22,
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
                  ),
                ),
              ],
            ),
          )
        : AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: startAnimation ? 1 : 0,
            curve: Curves.easeInOut,
            child: Container(
              height: null,
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
            ),
          );
  }
}
