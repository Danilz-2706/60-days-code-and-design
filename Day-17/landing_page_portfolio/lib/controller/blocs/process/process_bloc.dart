import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/back_end/process.dart';
import '../../services/service_exports.dart';

part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  final ProcessService processService;

  ProcessBloc({required this.processService}) : super(const ProcessState()) {
    on<CreateProcessEvent>(_createProcess);
    on<GetAllProcessEvent>(_getAllProcess);
  }

  FutureOr<void> _createProcess(
      CreateProcessEvent event, Emitter<ProcessState> emit) async {
    emit(LoadingProcessState());

    try {
      await processService.create(process: event.process);
      emit(CreateErrorProcessState());
    } catch (e) {
      emit(ErrorProcessState(error: e.toString()));
    }
  }

  FutureOr<void> _getAllProcess(
      GetAllProcessEvent event, Emitter<ProcessState> emit) async {
    emit(LoadingProcessState());

    try {
      final list = await processService.getAllProcess(workId: event.workId);
      emit(GetAllProcessState(listProcess: list!));
    } catch (e) {
      emit(ErrorProcessState(error: e.toString()));
    }
  }
}
