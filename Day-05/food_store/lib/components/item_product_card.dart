import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/spacing.dart';

class ItemProductCard extends StatelessWidget {
  const ItemProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.remainAmount,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final int price, remainAmount;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5,
        ),
        width: 200,
        child: Column(
          children: [
            // Image.asset(image),
            Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: (Radius.circular(12.0)),
                  topRight: (Radius.circular(12.0)),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: (Radius.circular(12.0)),
                  bottomRight: (Radius.circular(12.0)),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.28))
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                            text: "\$${price.toString()}",
                            style: TextStyle(
                                color: Colors.orange.withOpacity(0.5))),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "$remainAmount item",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
