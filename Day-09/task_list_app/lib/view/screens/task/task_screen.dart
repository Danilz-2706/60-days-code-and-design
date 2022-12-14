import 'package:flutter/material.dart';

import 'components/body_task_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BodyTaskScreen(),
    );
  }
}
