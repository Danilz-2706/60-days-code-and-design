import 'package:flutter/material.dart';
import '../../../../controllers/blocs/bloc_exports.dart';
import '../../../../models/font-end/text_about.dart';
import '../../../components/text_card.dart';

class TextAboutMe extends StatelessWidget {
  const TextAboutMe({
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
          var data = state.profile;

          return TextCard(
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
