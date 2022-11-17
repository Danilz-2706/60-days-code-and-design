import 'package:flutter/material.dart';
import 'package:food_store/components/title_default.dart';
import 'package:food_store/constants/spacing.dart';

import 'components/bill.dart';
import 'components/filter.dart';
import 'components/list_food.dart';
import 'components/ordered.dart';
import 'components/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Search(),
                SizedBox(height: kDefaultPadding),
                Filter(),
                SizedBox(height: kDefaultPadding),
                Expanded(child: ListFood()),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TitleDefault(title: "Order", time: "Table 8"),
                SizedBox(height: kDefaultPadding),
                Expanded(child: Ordered()),
                Bill()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
