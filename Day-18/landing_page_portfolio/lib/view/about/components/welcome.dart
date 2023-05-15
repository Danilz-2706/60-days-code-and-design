import 'package:flutter/material.dart';
import '../../../controller/cubits/cubit_export.dart';
import '../../../model/font-end/text_about.dart';
import '../../components/text_card.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileLoaded) {
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
