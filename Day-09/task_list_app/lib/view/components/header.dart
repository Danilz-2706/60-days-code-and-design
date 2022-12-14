import 'package:flutter/material.dart';
import 'package:task_list_app/controller/blocs/bloc_exports.dart';

import '../constants/responsive.dart';
import '../screens/task/components/add_task_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    this.tooltip,
    this.icon,
    this.active = false,
  }) : super(key: key);

  final String title;
  final String? tooltip;
  final IconData? icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              context.read<NavigatorMenuBloc>().controlMenu();
            },
          ),
        if (!Responsive.isMobile(context))
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        const Spacer(),
        if (active == true)
          IconButton(
            tooltip: tooltip,
            onPressed: () => _addTask(context),
            icon: Icon(
              icon,
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
