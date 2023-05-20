import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landing_page_portfolio/view/constans/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../controller/cubits/cubit_export.dart';
import '../components/btn_detail.dart';
import '../components/menu_title.dart';
import '../constans/colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    required this.beamer,
    Key? key,
  }) : super(key: key);
  final GlobalKey<BeamerState> beamer;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => widget
        .beamer.currentState?.routerDelegate
        .addListener(_setStateListener));
  }

  @override
  void dispose() {
    widget.beamer.currentState?.routerDelegate
        .removeListener(_setStateListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 240,
        backgroundColor: kBgDarkColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/icons/chatbot_wow.svg',
                  height: 100,
                  width: 100,
                ),
              ),
              Container(
                height: 2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  color: kSecondaryColor,
                ),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              MenuTitle(
                press: () {
                  widget.beamer.currentState?.routerDelegate
                      .beamToNamed('/portfolio/home');
                  Navigator.pop(context);
                },
                title: "Home",
                color: kMenuTextColor,
              ),
              const SizedBox(height: kDefaultPadding),
              MenuTitle(
                press: () {
                  widget.beamer.currentState?.routerDelegate
                      .beamToNamed('/portfolio/works');
                  Navigator.pop(context);
                },
                title: "Works",
                color: kMenuTextColor,
              ),
              const SizedBox(height: kDefaultPadding),
              MenuTitle(
                press: () {
                  widget.beamer.currentState?.routerDelegate
                      .beamToNamed('/portfolio/about-me');
                  Navigator.pop(context);
                },
                title: "About",
                color: kMenuTextColor,
              ),
              const SizedBox(height: kDefaultPadding),
              MenuTitle(
                press: () {
                  launchUrl(Uri.parse(
                      'https://drive.google.com/file/d/1tYYcP52VQmE6nM46QP6-LsU33GrJlW07/view?usp=sharing'));
                  Navigator.pop(context);
                },
                title: "Resume",
                color: kMenuTextColor,
              ),
              const SizedBox(height: kDefaultPadding),
              BtnDetail(
                title: "Get in touch",
                color: kTextColor,
                press: () {
                  widget.beamer.currentState?.routerDelegate
                      .beamToNamed('/portfolio/get-in-touch');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
