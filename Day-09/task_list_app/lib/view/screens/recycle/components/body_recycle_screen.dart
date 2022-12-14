import 'package:flutter/material.dart';

import '../../../components/header.dart';
import '../../../constants/color_spacing.dart';

class BodyRecycleScreen extends StatelessWidget {
  const BodyRecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          Header(
            title: "Recycle",
          ),
          SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
