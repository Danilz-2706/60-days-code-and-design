import 'package:flutter/material.dart';

class ItemProductOnlyImage extends StatelessWidget {
  const ItemProductOnlyImage({
    Key? key,
    required this.image,
    required this.spacing,
    required this.press,
  }) : super(key: key);

  final String image;
  final double spacing;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: spacing,
          top: spacing / 2,
          bottom: spacing / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
