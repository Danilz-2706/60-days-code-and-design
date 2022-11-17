import 'package:flutter/material.dart';

import '../constants/spacing.dart';

class ItemOrderProduct extends StatelessWidget {
  const ItemOrderProduct({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.qt,
  }) : super(key: key);

  final String image, name;
  final int price, qt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 44, 44, 44),
        borderRadius: BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              height: 90,
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
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name\n".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${price.toString()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  "$qt x",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
