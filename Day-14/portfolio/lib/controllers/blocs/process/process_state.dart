part of 'process_bloc.dart';

class ProcessState extends Equatable {
  const ProcessState();

  @override
  List<Object> get props => [];
}

class LoadingProcessState extends ProcessState {
  @override
  List<Object> get props => [];
}

class ErrorProcessState extends ProcessState {
  final String error;
  const ErrorProcessState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class CreateErrorProcessState extends ProcessState {
  @override
  List<Object> get props => [];
}

class GetAllProcessState extends ProcessState {
  final List<Process?>? listProcess;
  const GetAllProcessState({
    required this.listProcess,
  });

  @override
  List<Object> get props => [listProcess!];
}
