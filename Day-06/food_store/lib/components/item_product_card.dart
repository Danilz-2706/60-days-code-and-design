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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
            color: Color.fromARGB(255, 44, 44, 44),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$title\n".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$${price.toString()}",
                              style: TextStyle(
                                color: Colors.orange.withOpacity(0.5),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "$remainAmount item",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
