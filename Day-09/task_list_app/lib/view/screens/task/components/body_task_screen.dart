import 'package:flutter/material.dart';

import '../../../constants/color_spacing.dart';
import '../../../components/header.dart';
import '../../../components/list_task.dart';

class BodyTaskScreen extends StatelessWidget {
  const BodyTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(
          title: "Tasks",
          tooltip: "Add task",
          icon: Icons.add,
          active: true,
        ),
        SizedBox(height: defaultPadding),
        Expanded(child: ListTasks()),
      ],
    );
  }
}
