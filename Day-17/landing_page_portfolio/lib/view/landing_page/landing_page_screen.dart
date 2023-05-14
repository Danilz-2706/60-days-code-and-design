import 'package:flutter/material.dart';

import '../../model/fake_data.dart';
import '../constans/responsive.dart';
import 'components/item_social.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: !MyResponsive.isMobile(context)
            ? Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ListView.builder(
                        itemCount: list_social.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ItemSocial(
                              icon: list_social[index]['icon']!,
                              title: list_social[index]['title']!,
                              link: list_social[index]['link']!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      height: 400,
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                    Center(
                        child: ListView.builder(
                      itemCount: list_social.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ItemSocial(
                            icon: list_social[index]['icon']!,
                            title: list_social[index]['title']!,
                            link: list_social[index]['link']!,
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
      ),
    );
  }
}
