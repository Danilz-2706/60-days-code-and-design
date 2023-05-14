part of 'process_bloc.dart';

abstract class ProcessEvent extends Equatable {
  const ProcessEvent();

  @override
  List<Object> get props => [];
}

class CreateProcessEvent extends ProcessEvent {
  final Process process;

  const CreateProcessEvent({required this.process});

  @override
  List<Object> get props => [process];
}

class GetAllProcessEvent extends ProcessEvent {
  final String workId;

  const GetAllProcessEvent({required this.workId});

  @override
  List<Object> get props => [workId];
}
