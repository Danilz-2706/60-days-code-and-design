import 'package:flutter/material.dart';

import 'components/body_recycle_screen.dart';

class RecycleScreen extends StatelessWidget {
  const RecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BodyRecycleScreen(),
    );
  }
}
