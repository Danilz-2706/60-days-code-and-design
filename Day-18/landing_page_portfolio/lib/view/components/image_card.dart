import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.pic, this.size}) : super(key: key);
  final String pic;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 400,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(40.0),
        ),
        image: DecorationImage(
          image: NetworkImage(pic),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
