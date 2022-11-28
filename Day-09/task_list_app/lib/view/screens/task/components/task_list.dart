import 'package:flutter/material.dart';
import 'package:task_list_app/controller/blocs/bloc_exports.dart';
import 'package:task_list_app/models/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<TaskModel> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              list[index].title,
              style: TextStyle(
                decoration:
                    list[index].isDone! ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              onChanged: (value) {
                context
                    .read<TaskBloc>()
                    .add(UpdateTaskEvent(taskModel: list[index]));
              },
              value: list[index].isDone,
            ),
            onLongPress: () {
              context
                  .read<TaskBloc>()
                  .add(DeleteTaskEvent(taskModel: list[index]));
            },
          );
        },
      ),
    );
  }
}
