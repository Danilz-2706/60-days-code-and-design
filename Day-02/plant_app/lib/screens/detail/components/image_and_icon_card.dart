import 'package:flutter/material.dart';
import 'package:plant_app/models/product.dart';

import '../../../components/previous_page.dart';
import '../../../constants/spacing.dart';
import 'image_product.dart';
import 'list_icon_cards.dart';

class ImageAndIconCard extends StatelessWidget {
  const ImageAndIconCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: const [
                    PreviousPage(),
                    Spacer(),
                    ListIconCard(),
                  ],
                ),
              ),
            ),
            ImageProduct(
              imageProduct: product.image,
            )
          ],
        ),
      ),
    );
  }
}
