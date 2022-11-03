import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class ImageProduct extends StatelessWidget {
  const ImageProduct({
    Key? key,
    required this.imageProduct,
  }) : super(key: key);

  final String imageProduct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      width: size.width * 0.75,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(64),
            bottomLeft: Radius.circular(64),
          ),
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            image: AssetImage(imageProduct),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              color: kPrimaryColor.withOpacity(0.28),
              blurRadius: 60,
            )
          ]),
    );
  }
}
