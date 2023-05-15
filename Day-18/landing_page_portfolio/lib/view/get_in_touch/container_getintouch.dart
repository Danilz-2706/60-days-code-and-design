import 'package:flutter/material.dart';
import '../../controller/cubits/cubit_export.dart';
import '../components/footer.dart';
import '../components/menu_title.dart';
import '../constans/colors.dart';
import '../constans/grid_system.dart';
import '../constans/spacing.dart';
import 'components/item_left.dart';
import 'my_form_field.dart';

class ContainerGetInTouch extends StatelessWidget {
  const ContainerGetInTouch({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: gridSystemMyApp(
        context,
        [
          // BigTitle(context: context, title: "Get in touch"),
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
                const ItemLeft(),
                const GradientText(
                  text: "WANT TO CALL ME?",
                  gradient: kPrimaryColor,
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProfileLoaded) {
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
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProfileLoaded) {
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
