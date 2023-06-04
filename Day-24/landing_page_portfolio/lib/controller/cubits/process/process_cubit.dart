import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/back_end/process.dart';

part 'process_state.dart';

class ProcessCubit extends Cubit<ProcessState> {
  ProcessCubit() : super(ProcessInitial());
  List<Process> listSample = [];
  void getAllProcess(String workId) {
    List<Process> list =
        listSample.where((element) => element.workId == workId).toList();
    if (list.isEmpty) {
      emit(ProcessLoadingState());
      try {
        createIsolate(workId);
      } catch (e) {
        emit(ProcessErrorState());
      }
    } else {
      emit(ProcessLoadingState());
      emit(GetAllProcessState(listProcess: list));
    }
  }

  Future<void> createIsolate(String workId) async {
    try {
      final worker = Worker('worker.js');

      worker.postMessage({'type': 'getProcess', 'workId': workId});

      worker.onMessage.listen((message) {
        // ignore: unnecessary_null_comparison
        if (message != null) {
          List<Process> listProcess = [];
          List<dynamic> list = jsonDecode(message.data);

          for (var e in list) {
            listProcess.add(Process.fromMap(e));
          }
          listProcess.sort((a, b) => a.number.compareTo(b.number));
          listSample.addAll(listProcess);

          emit(GetAllProcessState(listProcess: listProcess));
        } else {
          emit(ProcessErrorState());
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
