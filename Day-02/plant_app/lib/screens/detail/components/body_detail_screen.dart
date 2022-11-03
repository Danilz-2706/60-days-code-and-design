import 'package:flutter/material.dart';
import 'package:plant_app/constants/spacing.dart';
import '../../../models/product.dart';
import 'buy_now_and_description.dart';
import 'image_and_icon_card.dart';
import 'title_and_price.dart';

class BodyDetailScreen extends StatelessWidget {
  const BodyDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIconCard(
            product: product,
          ),
          TitleAndPrice(
            title: product.title,
            country: product.country,
            price: product.price,
          ),
          const SizedBox(height: kDefaultPadding),
          const BuyNowAndDescription(),
        ],
      ),
    );
  }
}
