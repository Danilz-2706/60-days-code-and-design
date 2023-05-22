part of 'work_only_cubit.dart';

abstract class WorkOnlyState extends Equatable {
  const WorkOnlyState();

  @override
  List<Object> get props => [];
}

class WorkOnlyLoading extends WorkOnlyState {}

class WorkOnlyInitial extends WorkOnlyState {}

class WorkOnlyLoaded extends WorkOnlyState {
  final Work work;
  const WorkOnlyLoaded({
    required this.work,
  });

  @override
  List<Object> get props => [work];
}

class WorkOnlyError extends WorkOnlyState {}
