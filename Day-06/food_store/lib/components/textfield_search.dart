import 'package:flutter/material.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    Key? key,
    required this.hintext,
  }) : super(key: key);

  final String hintext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          hintText: hintext,
        ),
      ),
    );
  }
}
