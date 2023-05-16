import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../controller/cubits/cubit_export.dart';
import '../../../model/font-end/text_about.dart';
import '../../components/text_card.dart';

class TextAboutMe extends StatelessWidget {
  const TextAboutMe({
    Key? key,
    required this.startAnimation,
  }) : super(key: key);
  final bool startAnimation;
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
            overFlow: true,
            listTextAbout: [
              TextAbout(heading: Heading.header, header: "About Me"),
              TextAbout(heading: Heading.text, text: data.aboutMe),
            ],
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
