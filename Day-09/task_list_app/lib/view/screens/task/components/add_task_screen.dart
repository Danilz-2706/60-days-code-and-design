import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_list_app/models/task_model.dart';

import '../../../../controller/blocs/bloc_exports.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Add Task",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleController,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Random random = Random();
                  int id = random.nextInt(1000);
                  var task =
                      TaskModel(id: id.toString(), title: titleController.text);
                  context.read<TaskBloc>().add(AddTaskEvent(taskModel: task));
                  Navigator.pop(context);
                },
                child: const Text(
                  "Add",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
