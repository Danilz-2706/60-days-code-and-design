part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<TaskModel> allTasks;
  const TaskState({
    this.allTasks = const <TaskModel>[],
  });

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<TaskModel>.from(
        (map['allTasks']?.map((x) => TaskModel.fromMap(x))),
      ),
    );
  }
}
