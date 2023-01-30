import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/profile/profile_bloc.dart';
import '../../../../models/font-end/text_about.dart';
import '../../../components/text_card.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          var data = state.profile;
          return TextCard(
            overFlow: false,
            listTextAbout: [
              TextAbout(
                heading: Heading.header,
                header: "Hi, I'm ${data.name}",
                myFontsize: 36,
              ),
              TextAbout(
                heading: Heading.text,
                text: "Product Designer",
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
