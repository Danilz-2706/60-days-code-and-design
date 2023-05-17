part of 'work_cubit.dart';

abstract class WorkState extends Equatable {
  const WorkState();

  @override
  List<Object> get props => [];
}

class WorkInitial extends WorkState {}

class WorkLoading extends WorkState {}

class WorkLoaded extends WorkState {
  final List<Work> listWork;
  const WorkLoaded({
    required this.listWork,
  });

  @override
  List<Object> get props => [listWork];
}

class WorkError extends WorkState {}
