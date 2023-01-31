import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/back_end/work.dart';
import '../../services/firestore_service/work.dart';

part 'work_event.dart';
part 'work_state.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  final WorkService workService;

  WorkBloc({required this.workService}) : super(const WorkState()) {
    on<CreateWorkEvent>(_createWork);
    on<GetAllWorkEvent>(_getAllWork);
    on<GetOnlyWorkEvent>(_getOnlyWork);
  }

  FutureOr<void> _createWork(
      CreateWorkEvent event, Emitter<WorkState> emit) async {
    emit(LoadingWorkState());
    try {
      await workService.create(work: event.work);
      emit(CreateWorkState());
    } catch (e) {
      emit(ErrorWorkState(error: e.toString()));
    }
  }

  FutureOr<void> _getAllWork(
      GetAllWorkEvent event, Emitter<WorkState> emit) async {
    try {
      final list = await workService.getAllWork();
      emit(GetAllWorkState(listWork: list));
    } catch (e) {
      emit(ErrorWorkState(error: e.toString()));
    }
  }

  FutureOr<void> _getOnlyWork(
      GetOnlyWorkEvent event, Emitter<WorkState> emit) async {
    try {
      final work = await workService.getOnlyWork(workId: event.workId);
      emit(GetOnlyWorkState(work: work!));
    } catch (e) {
      emit(ErrorWorkState(error: e.toString()));
    }
  }
}
