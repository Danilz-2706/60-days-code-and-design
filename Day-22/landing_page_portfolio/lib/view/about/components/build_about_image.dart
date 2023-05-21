import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../controller/cubits/cubit_export.dart';
import '../../components/image_card.dart';
import '../../constans/spacing.dart';

class BuildAbout extends StatelessWidget {
  const BuildAbout({
    super.key,
    required this.startAnimation,
    this.leftAnimation,
    this.bottomAnimation,
    this.rightAnimation,
    this.topAnimation,
  });

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
          return ImageCard(
            pic: state.profile.avatar,
            size: kDefaultHeigthComponent,
            startAnimation: startAnimation,
            leftAnimation: leftAnimation,
            bottomAnimation: bottomAnimation,
            rightAnimation: rightAnimation,
            topAnimation: topAnimation,
          );
        }
        return Container();
      },
    );
  }
}
