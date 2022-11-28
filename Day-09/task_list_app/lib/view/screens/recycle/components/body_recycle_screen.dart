import 'package:flutter/material.dart';

import '../../../components/list_task.dart';
import '../../../constants/color_spacing.dart';

class BodyRecycleScreen extends StatelessWidget {
  const BodyRecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          SizedBox(height: defaultPadding),
          Expanded(
            child: ListTasks(),
          ),
        ],
      ),
    );
  }
}
