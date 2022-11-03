import 'package:flutter/material.dart';
import 'package:plant_app/models/product.dart';

import '../../../components/item_product_only_image.dart';
import '../../../constants/spacing.dart';

class ListFeaturedPlants extends StatelessWidget {
  const ListFeaturedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = fakedata;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(list.length, (index) {
            if (list[index].rate == false) {
              return ItemProductOnlyImage(
                image: list[index].image,
                spacing: kDefaultPadding,
                press: () {},
              );
            } else {
              return const SizedBox.shrink();
            }
          })
        ],
      ),
    );
  }
}
