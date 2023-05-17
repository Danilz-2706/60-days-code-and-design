import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../controller/cubits/cubit_export.dart';
import '../../../model/font-end/text_about.dart';
import '../../components/text_card.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
    required this.startAnimation,
    this.leftAnimation,
    this.bottomAnimation,
    this.rightAnimation,
    this.topAnimation,
  }) : super(key: key);

  final bool startAnimation;
  final double? leftAnimation;
  final double? bottomAnimation;
  final double? rightAnimation;
  final double? topAnimation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const SizedBox(
            height: 280,
            child: RiveAnimation.asset("assets/animations/anima_reply-ing.riv"),
          );
        } else if (state is ProfileLoaded) {
          var data = state.profile;
          return TextCard(
            startAnimation: startAnimation,
            leftAnimation: leftAnimation,
            rightAnimation: rightAnimation,
            topAnimation: topAnimation,
            bottomAnimation: bottomAnimation,
            overFlow: false,
            listTextAbout: [
              TextAbout(
                heading: Heading.header,
                header: "Hi, I'm ${data.name}",
                myFontsize: 36,
              ),
              TextAbout(
                heading: Heading.text,
                text: data.major,
                myFontsize: 24,
              ),
            ],
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
