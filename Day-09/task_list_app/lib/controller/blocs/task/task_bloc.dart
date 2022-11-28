import 'package:equatable/equatable.dart';
import 'package:task_list_app/controller/blocs/bloc_exports.dart';
import 'package:task_list_app/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(_addTaskEvent);
    on<UpdateTaskEvent>(_updateTaskEvent);
    on<DeleteTaskEvent>(_deleteTaskEvent);
  }

  void _addTaskEvent(AddTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)..add(event.taskModel),
      ),
    );
  }

  void _updateTaskEvent(UpdateTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.taskModel;
    final int index = state.allTasks.indexOf(task);

    List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(
      TaskState(
        allTasks: allTasks,
      ),
    );
  }

  void _deleteTaskEvent(DeleteTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;

    List<TaskModel> allTask = List.from(state.allTasks)
      ..remove(event.taskModel);

    emit(
      TaskState(
        allTasks: allTask,
      ),
    );
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
