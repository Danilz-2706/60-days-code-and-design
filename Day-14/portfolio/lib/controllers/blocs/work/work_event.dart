part of 'work_bloc.dart';

abstract class WorkEvent extends Equatable {
  const WorkEvent();

  @override
  List<Object> get props => [];
}

class CreateWorkEvent extends WorkEvent {
  final Work work;

  const CreateWorkEvent({required this.work});

  @override
  List<Object> get props => [work];
}

class GetAllWorkEvent extends WorkEvent {
  @override
  List<Object> get props => [];
}

class GetOnlyWorkEvent extends WorkEvent {
  final String workId;

  const GetOnlyWorkEvent({required this.workId});
  @override
  List<Object> get props => [workId];
}
