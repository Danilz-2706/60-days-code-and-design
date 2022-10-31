import 'package:choose_right_price/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeftScreen extends StatefulWidget {
  final int currentProduct;
  const LeftScreen({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  State<LeftScreen> createState() => _LeftScreenState();
}

class _LeftScreenState extends State<LeftScreen> {
  String _result = "";
  int? _inputtedPrice;

  var list = products;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text("Welcome to !!!"),
            const SizedBox(height: 16),
            const Text("CHOOSE THE RIGHT PRICE"),
            const SizedBox(height: 48),
            const Text("Please give us the amount you think is correct"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                key: const Key('priceInput'),
                onChanged: (value) {
                  _inputtedPrice = int.tryParse(value);
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _result =
                        _inputtedPrice == products[widget.currentProduct].price
                            ? 'pass'
                            : 'fail';
                  },
                );
              },
              child: const Text("Are you sure?"),
            ),
            const SizedBox(height: 16),
            Text(_result),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _result = '';
                    _inputtedPrice = 0;
                  },
                );
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
