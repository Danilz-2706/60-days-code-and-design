import 'package:flutter/material.dart';

import '../../../constants/responsive.dart';
import 'add_task_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Tasks",
            style: Theme.of(context).textTheme.headline6,
          ),
        const Spacer(),
        IconButton(
          tooltip: "Add Task",
          onPressed: () => _addTask(context),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }
}
