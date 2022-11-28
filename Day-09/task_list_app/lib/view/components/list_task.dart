import 'package:flutter/material.dart';

import '../../controller/blocs/bloc_exports.dart';
import '../../models/task_model.dart';
import '../screens/task/components/task_list.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = state.allTasks;
        var done = taskList.where((e) => e.isDone == true).toList();
        return Column(
          children: [
            Center(
              child: Chip(
                label: Text("${taskList.length} Task | Done: ${done.length}"),
              ),
            ),
            TaskList(
              list: taskList,
            )
          ],
        );
      },
    );
  }
}
