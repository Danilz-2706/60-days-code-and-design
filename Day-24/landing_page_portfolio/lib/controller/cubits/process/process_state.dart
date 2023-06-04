part of 'process_cubit.dart';

abstract class ProcessState extends Equatable {
  const ProcessState();

  @override
  List<Object> get props => [];
}

class ProcessInitial extends ProcessState {}

class ProcessLoadingState extends ProcessState {}

class ProcessErrorState extends ProcessState {}

class GetAllProcessState extends ProcessState {
  final List<Process?>? listProcess;
  const GetAllProcessState({
    required this.listProcess,
  });

  @override
  List<Object> get props => [listProcess!];
}
