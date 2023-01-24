import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/controllers/services/firestore_service/process.dart';

import '../../../models/back_end/process.dart';

part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  final ProcessService processService;

  ProcessBloc({required this.processService}) : super(ProcessState()) {
    on<CreateProcessEvent>(_createProcess);
    on<GetAllProcessEvent>(_getAllProcess);
  }

  FutureOr<void> _createProcess(
      CreateProcessEvent event, Emitter<ProcessState> emit) async {
    try {
      await processService.create(process: event.process);
      emit(CreateErrorProcessState());
    } catch (e) {
      emit(ErrorProcessState(error: e.toString()));
    }
  }

  FutureOr<void> _getAllProcess(
      GetAllProcessEvent event, Emitter<ProcessState> emit) async {
    try {
      final list = await processService.getAllProcess(workId: event.workId);
      emit(GetAllProcessState(listProcess: list!));
    } catch (e) {
      emit(ErrorProcessState(error: e.toString()));
    }
  }
}
