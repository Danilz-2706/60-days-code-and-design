import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landing_page_portfolio/model/back_end/profile.dart';
import 'package:landing_page_portfolio/model/fake_data.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import '../../controller/cubits/cubit_export.dart';
import '../components/footer.dart';
import '../components/menu_title.dart';
import '../constans/colors.dart';
import '../constans/grid_system.dart';
import '../constans/spacing.dart';
import 'components/connect_with_me.dart';
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
                        return SizedBox(
                          child: Row(
                            children: [
                              const Text(
                                "Viet Nam: ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kTextColor,
                                ),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "+84${state.profile.numberPhone}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: kTextColor,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              Tooltip(
                                message: "Copy",
                                child: IconButton(
                                  onPressed: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text:
                                            "+84${state.profile.numberPhone}"));
                                  },
                                  icon: const Icon(
                                    Icons.copy_all,
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Text("Error");
                      }
                    },
                  ),
                  const SizedBox(height: kDefaultPadding),
                  const GradientText(
                    text: "JUST WANT TO CONNECT WITH ME?",
                    gradient: kPrimaryColor,
                    style: TextStyle(fontSize: 18, color: kTextColor),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoading) {
                        return const SizedBox(
                          height: 80,
                          child: RiveAnimation.asset(
                              "assets/animations/anima_reply-ing.riv"),
                        );
                      } else if (state is ProfileLoaded) {
                        return Column(
                          children: [
                            ...List.generate(
                              list_social2.length,
                              (index) {
                                if (index > 0) {
                                  return SizedBox(
                                    child: ConnectWithMe(
                                      check: false,
                                      press: () {
                                        launchUrl(Uri.parse(
                                            list_social2[index]['link']!));
                                      },
                                      title: list_social2[index]['title']!,
                                      name: list_social2[index]['name']!,
                                    ),
                                  );
                                }
                                return SizedBox(
                                  child: ConnectWithMe(
                                    check: true,
                                    press: () {},
                                    title: "Email",
                                    name: state.profile.emailAddress,
                                  ),
                                );
                              },
                            )
                          ],
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
