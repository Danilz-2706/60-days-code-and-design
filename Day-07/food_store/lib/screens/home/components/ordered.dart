import 'package:flutter/material.dart';
import 'package:food_store/constants/spacing.dart';

import '../../../components/item_order_product.dart';
import '../../../models/food.dart';

class Ordered extends StatelessWidget {
  const Ordered({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = fakeData;
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          list.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: ItemOrderProduct(
              name: list[index].name,
              image: list[index].image,
              price: list[index].price,
              qt: 0,
            ),
          ),
        ),
      ),
    );
  }
}
