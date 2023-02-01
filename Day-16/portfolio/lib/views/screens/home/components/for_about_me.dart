import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../../controllers/blocs/bloc_exports.dart';
import '../../../../models/font-end/animated_positioned.dart';
import '../../../components/item_card.dart';
import '../../../constans/colors.dart';

class ForAboutMe extends StatelessWidget {
  const ForAboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is LoadingProfileState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedProfileState) {
          final data = state.profile;
          return ItemCard(
            list: [
              MyAnimatedPositioned(
                type: Type.text,
                topb: 80,
                topa: 30,
                duration: const Duration(milliseconds: 260),
                fontsizeb: 40,
                colorb: kTextColor,
                colora: Colors.transparent,
                textb: "Hey, I'm ${data.name}",
              ),
              MyAnimatedPositioned(
                type: Type.text,
                bottomb: 100,
                bottoma: 60,
                duration: const Duration(milliseconds: 260),
                fontsizeb: 18,
                colorb: kTextColor,
                colora: Colors.transparent,
                textb: "\"Design isn't just about making things pretty\"",
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
          return const Text("Error");
        }
      },
    );
  }
}
