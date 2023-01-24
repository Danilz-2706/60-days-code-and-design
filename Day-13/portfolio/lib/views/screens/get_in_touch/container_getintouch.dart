import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/controllers/blocs/work/work_bloc.dart';

import '../../../controllers/blocs/profile/profile_bloc.dart';
import '../../components/big_title.dart';
import '../../components/footer.dart';
import '../../components/menu_title.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';
import '../../constans/spacing.dart';
import 'my_form_field.dart';

class ContainerGetInTouch extends StatelessWidget {
  const ContainerGetInTouch({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: gridSystemMyApp(
        context,
        [
          BigTitle(context: context, title: "Get in touch"),
          item50(
            context,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Get in Touch",
                  style: TextStyle(fontSize: 40, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding),
                const Text(
                  "Are you looking for a UX/UI designer to help with your next project?",
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding),
                const Text(
                  "I'd love to hear from you! Whether it's for a charity event, conceptual project or anything in relation to UX and UI I can help! Just contact me on this form or email below and let's start collaborating!",
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding),
                const GradientText(
                  text: "WANT TO CALL ME?",
                  gradient: kPrimaryColor,
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LoadedState) {
                      var data = state.profile;

                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            data.numberPhone,
                            style: const TextStyle(
                                fontSize: 18,
                                color: kTextColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      );
                    } else {
                      return const Text("Error");
                    }
                  },
                ),
                const SizedBox(height: kDefaultPadding),
                const GradientText(
                  text: "JUST WANT TO EMAIL ME?",
                  gradient: kPrimaryColor,
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LoadedState) {
                      var data = state.profile;
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            data.emailAddress,
                            style: const TextStyle(
                                fontSize: 18,
                                color: kTextColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      );
                    } else {
                      return const Text("Error");
                    }
                  },
                ),
              ],
            ),
          ),
          item50(
            context,
            widget: const MyFormField(),
          ),
          item100(
            context,
            widget: const Footer(),
          ),
        ],
      ),
    );
  }
}
