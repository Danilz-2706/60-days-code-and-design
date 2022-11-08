import 'package:flutter/material.dart';

import '../../../components/item_product_card.dart';

class ListFood extends StatelessWidget {
  const ListFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: ItemProductCard(
          image: "assets/images/1.png",
          title: "Original Burger",
          price: 5,
          remainAmount: 11,
          press: () {},
        ),
      ),
    );
  }
}
