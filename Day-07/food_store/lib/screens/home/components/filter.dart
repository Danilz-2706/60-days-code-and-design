import 'package:flutter/material.dart';
import 'package:food_store/models/food.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = fakeDataFilter;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List.generate(
            list.length,
            (index) => ItemInFillter(
              icon: list[index].icon,
              title: list[index].title,
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ItemInFillter extends StatelessWidget {
  const ItemInFillter({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: Color.fromARGB(250, 235, 149, 21),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 38,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
