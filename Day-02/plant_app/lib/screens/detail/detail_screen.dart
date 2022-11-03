import 'package:flutter/material.dart';
import 'package:plant_app/models/product.dart';

import 'components/body_detail_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BodyDetailScreen(
        product: product,
      )),
    );
  }
}
