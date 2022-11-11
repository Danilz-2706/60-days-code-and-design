import 'package:flutter/material.dart';
import 'package:food_store/constants/spacing.dart';

class Bill extends StatelessWidget {
  const Bill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 44, 44, 44),
        borderRadius: BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      height: 440,
      child: Column(
        children: const [
          ItemBill(title: "Sub Total", price: 40),
          ItemBill(title: "Tax", price: 40),
          Devider(),
          ItemBill(title: "Total", price: 40),
          ButtonPrintBills(),
        ],
      ),
    );
  }
}

class ButtonPrintBills extends StatelessWidget {
  const ButtonPrintBills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding / 0.8,
        vertical: kDefaultPadding,
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.print,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Print Bills",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Devider extends StatelessWidget {
  const Devider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding / 0.8,
        vertical: kDefaultPadding,
      ),
      child: Container(
        height: 2,
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }
}

class ItemBill extends StatelessWidget {
  const ItemBill({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String title;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding / 0.8,
        vertical: kDefaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            "\$$price",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
