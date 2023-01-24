import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.pic}) : super(key: key);
  final String pic;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(40.0),
        ),
        image: DecorationImage(
          image: AssetImage(pic),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
