import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/back_end/work.dart';

part 'work_state.dart';

class WorkCubit extends Cubit<WorkState> {
  WorkCubit() : super(WorkInitial());
  void getAllWork() {
    emit(WorkLoading());
    try {
      createIsolate();
    } catch (e) {
      emit(WorkError());
    }
  }

  Future<void> createIsolate() async {
    try {
      final worker = Worker('worker.js');

      worker.postMessage({'type': 'getWork'});

      worker.onMessage.listen((message) {
        if (message != null) {
          List<Work> listAllWork = [];
          List<dynamic> list = jsonDecode(message.data);
          for (var e in list) {
            listAllWork.add(Work.fromMap(e));
          }

          emit(WorkLoaded(listWork: listAllWork));
        } else {
          emit(WorkError());
        }
        worker.terminate();
      });
    } catch (e) {
      print(e);
    }
  }
}
