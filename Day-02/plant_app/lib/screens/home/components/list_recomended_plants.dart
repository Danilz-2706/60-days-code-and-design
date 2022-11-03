import 'package:flutter/material.dart';
import 'package:plant_app/models/product.dart';
import 'package:plant_app/screens/detail/detail_screen.dart';

import '../../../components/item_product_card.dart';

class ListRecomendedPlants extends StatelessWidget {
  const ListRecomendedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = fakedata;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            list.length,
            (index) {
              if (list[index].rate == true) {
                return ItemProductCard(
                  title: list[index].title,
                  country: list[index].country,
                  image: list[index].image,
                  price: list[index].price,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: list[index],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
