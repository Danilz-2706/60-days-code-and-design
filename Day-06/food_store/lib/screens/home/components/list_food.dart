import 'package:flutter/material.dart';
import 'package:food_store/models/food.dart';

import '../../../components/item_product_card.dart';

class ListFood extends StatelessWidget {
  const ListFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var list = fakeData;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size.width > 1667
            ? 4
            : size.width < 890
                ? 1
                : size.width < 1250
                    ? 2
                    : 3,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ItemProductCard(
          image: list[index].image,
          title: list[index].name,
          price: list[index].price,
          remainAmount: list[index].remainAmount,
          press: () {},
        );
      },
    );
  }
}
