import 'package:choose_right_price/models/product.dart';
import 'package:flutter/material.dart';

class RightScreen extends StatelessWidget {
  final int currentProduct;
  const RightScreen({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = products;

    return Expanded(
      flex: 1,
      child: Image(image: AssetImage(list[currentProduct].image)),
    );
  }
}
