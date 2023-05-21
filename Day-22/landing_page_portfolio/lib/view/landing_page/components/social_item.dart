import 'package:flutter/material.dart';

import '../../../model/fake_data.dart';
import 'item_social.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({
    super.key,
    required this.startAnimation,
  });

  final bool startAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        child: Wrap(
          children: List.generate(
            list_social.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemSocial(
                  startAnimation: startAnimation,
                  positionY: -60,
                  icon: list_social[index]['icon']!,
                  title: list_social[index]['title']!,
                  link: list_social[index]['link']!,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
