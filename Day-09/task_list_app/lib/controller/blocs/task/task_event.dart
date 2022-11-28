part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  const AddTaskEvent({required this.taskModel});

  @override
  List<Object> get props => [taskModel];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  const UpdateTaskEvent({required this.taskModel});

  @override
  List<Object> get props => [taskModel];
}

class DeleteTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  const DeleteTaskEvent({required this.taskModel});

  @override
  List<Object> get props => [taskModel];
}
