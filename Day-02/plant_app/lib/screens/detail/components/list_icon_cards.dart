import 'package:flutter/cupertino.dart';

import '../../../components/icon_card.dart';

class ListIconCard extends StatelessWidget {
  const ListIconCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        IconCard(icon: "assets/icons/sun.svg"),
        IconCard(icon: "assets/icons/icon_2.svg"),
        IconCard(icon: "assets/icons/icon_3.svg"),
        IconCard(icon: "assets/icons/icon_4.svg"),
      ],
    );
  }
}
