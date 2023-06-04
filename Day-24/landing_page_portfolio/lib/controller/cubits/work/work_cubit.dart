import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        // ignore: unnecessary_null_comparison
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
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
