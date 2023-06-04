import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../controller/cubits/cubit_export.dart';
import '../../../model/font-end/animated_positioned.dart';
import '../../components/item_card.dart';
import '../../constans/colors.dart';

class ForAboutMe extends StatelessWidget {
  const ForAboutMe({
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
          return Container(
            width: double.infinity,
            height: 280,
            decoration: const BoxDecoration(
              gradient: kSecondaryColorlinear,
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            child: const RiveAnimation.asset(
                "assets/animations/anima_reply-ing.riv"),
          );
        } else if (state is ProfileLoaded) {
          return ItemCard(
            startAnimation: startAnimation,
            leftAnimation: leftAnimation,
            rightAnimation: rightAnimation,
            topAnimation: topAnimation,
            bottomAnimation: bottomAnimation,
            list: [
              MyAnimatedPositioned(
                type: Type.text,
                topb: 80,
                topa: 30,
                duration: const Duration(milliseconds: 260),
                fontsizeb: 40,
                colorb: kTextColor,
                colora: Colors.transparent,
                textb: "Hey, I'm ${state.profile.name}",
              ),
              MyAnimatedPositioned(
                type: Type.text,
                bottomb: 100,
                bottoma: 60,
                duration: const Duration(milliseconds: 260),
                fontsizeb: 18,
                colorb: kTextColor,
                colora: Colors.transparent,
                textb: "\"${state.profile.slogan}\"",
              ),
              MyAnimatedPositioned(
                type: Type.text,
                bottomb: 10,
                bottoma: 50,
                duration: const Duration(milliseconds: 260),
                fontsizeb: 48,
                colora: kTextColor,
                colorb: Colors.transparent,
                texta: "Learn\nMore\nAbout Me",
              ),
              MyAnimatedPositioned(
                type: Type.icon,
                duration: const Duration(milliseconds: 260),
                righta: 30,
                rightb: 20,
                bottomb: 30,
                bottoma: 30,
                icon: "assets/icons/all_work.svg",
                colorb: kTextColor,
                colora: kTextColor,
                fontsizeb: 40,
                fontsizea: 40,
              ),
            ],
            press: () {
              context.beamToNamed('about-me');
            },
          );
        } else {
          return Container(
            width: double.infinity,
            height: 280,
            decoration: const BoxDecoration(
              gradient: kSecondaryColorlinear,
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            child: const Text("Error"),
          );
        }
      },
    );
  }
}
