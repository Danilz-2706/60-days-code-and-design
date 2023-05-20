import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/back_end/work.dart';

part 'work_only_state.dart';

class WorkOnlyCubit extends Cubit<WorkOnlyState> {
  WorkOnlyCubit() : super(WorkOnlyInitial());
  List<Work> listWork = [];

  Work? checkWork(String workId) {
    for (var e in listWork) {
      if (e.workId == workId) {
        return e;
      }
    }
    return null;
  }

  void getOnlyWork(String workId) {
    emit(WorkOnlyLoading());
    var x = checkWork(workId);
    if (x == null) {
      emit(WorkOnlyLoading());
      try {
        createIsolate1(workId);
      } catch (e) {
        emit(WorkOnlyError());
      }
    } else {
      emit(WorkOnlyLoading());
      emit(WorkOnlyLoaded(work: x));
    }
  }

  Future<void> createIsolate1(String workId) async {
    try {
      final worker = Worker('worker.js');

      worker.postMessage({'type': 'getOnlyWork', 'workId': workId});

      worker.onMessage.listen((message) {
        if (message != null) {
          Work work = Work.fromMap(jsonDecode(message.data));
          listWork.add(work);

          emit(WorkOnlyLoaded(work: work));
        } else {
          emit(WorkOnlyError());
        }
        worker.terminate();
      });
    } catch (e) {
      print(e);
    }
  }
}
