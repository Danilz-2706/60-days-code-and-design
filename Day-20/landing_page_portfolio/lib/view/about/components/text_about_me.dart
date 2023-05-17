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
          List<String> lines = data.aboutMe.split("\\n");
          return TextCard(
            startAnimation: startAnimation,
            overFlow: true,
            listTextAbout: [
              TextAbout(heading: Heading.header, header: "About Me"),
              ...List.generate(
                lines.length,
                (index) {
                  return TextAbout(heading: Heading.text, text: lines[index]);
                },
              )
            ],
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
