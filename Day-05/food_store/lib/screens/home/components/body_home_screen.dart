import 'package:flutter/material.dart';
import 'package:food_store/constants/spacing.dart';

import 'bill.dart';
import 'filter.dart';
import 'list_food.dart';
import 'ordered.dart';
import 'search.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: kDefaultPadding / 1.5,
          right: kDefaultPadding / 1.5,
          top: kDefaultPadding),
      color: Colors.yellow,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Search(),
                  SizedBox(height: kDefaultPadding),
                  Filter(),
                  SizedBox(height: kDefaultPadding),
                  ListFood(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  RichText(
                    text: const TextSpan(),
                  ),
                  const Ordered(),
                  const Bill()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
