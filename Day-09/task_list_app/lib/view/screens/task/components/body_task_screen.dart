import 'package:flutter/material.dart';

import '../../../constants/color_spacing.dart';
import 'header.dart';
import '../../../components/list_task.dart';

class BodyTaskScreen extends StatelessWidget {
  const BodyTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          Header(),
          SizedBox(height: defaultPadding),
          Expanded(child: ListTasks()),
        ],
      ),
    );
  }
}
