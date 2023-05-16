import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import '../../controller/cubits/cubit_export.dart';
import '../components/footer.dart';
import '../components/menu_title.dart';
import '../constans/colors.dart';
import '../constans/grid_system.dart';
import '../constans/spacing.dart';
import 'components/item_left.dart';
import 'components/my_form_field.dart';

class ContainerGetInTouch extends StatefulWidget {
  const ContainerGetInTouch({super.key});

  @override
  State<ContainerGetInTouch> createState() => _ContainerGetInTouchState();
}

class _ContainerGetInTouchState extends State<ContainerGetInTouch> {
  late ScrollController scrollController;
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    Future.delayed(const Duration(microseconds: 500), () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          startAnimation = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebSmoothScroll(
      controller: scrollController,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        child: gridSystemMyApp(
          context,
          [
            // BigTitle(context: context, title: "Get in touch"),
            item50(
              context,
              false,
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
                        return const SizedBox(
                          height: 280,
                          child: RiveAnimation.asset(
                              "assets/animations/anima_reply-ing.riv"),
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
                        return SizedBox(
                          height: 80,
                          child: const RiveAnimation.asset(
                              "assets/animations/anima_reply-ing.riv"),
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
              false,
              widget: const MyFormField(),
            ),
            item100(
              context,
              false,
              widget: const Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
