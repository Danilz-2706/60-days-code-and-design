part of 'work_bloc.dart';

class WorkState extends Equatable {
  const WorkState();

  @override
  List<Object> get props => [];
}

class LoadingWorkState extends WorkState {
  @override
  List<Object> get props => [];
}

class ErrorWorkState extends WorkState {
  final String error;
  const ErrorWorkState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class CreateWorkState extends WorkState {
  @override
  List<Object> get props => [];
}

class GetAllWorkState extends WorkState {
  final List<Work> listWork;
  const GetAllWorkState({
    required this.listWork,
  });

  @override
  List<Object> get props => [listWork];
}

class GetOnlyWorkState extends WorkState {
  final Work work;
  const GetOnlyWorkState({
    required this.work,
  });

  @override
  List<Object> get props => [work];
}
