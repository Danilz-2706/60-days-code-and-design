import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/back_end/process.dart';

part 'process_state.dart';

class ProcessCubit extends Cubit<ProcessState> {
  final worker = Worker('lib/worker.js');
  ProcessCubit() : super(ProcessInitial());

  void getAllProcess(String workId) {
    emit(ProcessLoadingState());
    try {
      createIsolate(workId);
    } catch (e) {
      emit(ProcessErrorState());
    }
  }

  Future<void> createIsolate(String workId) async {
    try {
      worker.postMessage({'type': 'getProcess', 'workId': workId});

      worker.onMessage.listen((message) {
        if (message != null) {
          List<Process> listProcess = [];
          List<dynamic> list = jsonDecode(message.data);
          for (var e in list) {
            listProcess.add(Process.fromMap(e));
          }
          emit(GetAllProcessState(listProcess: listProcess));
        } else {
          emit(ProcessErrorState());
        }
        worker.terminate();
      });
    } catch (e) {
      print(e);
    }
  }
}
