import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/back_end/get_in_touch.dart';

part 'get_in_touch_state.dart';

class GetInTouchCubit extends Cubit<GetInTouchState> {
  final worker = Worker('lib/worker.js');
  GetInTouchCubit() : super(GetInTouchInitial());

  void getAllGetInTouch() {
    emit(GetInTouchLoading());
    try {
      createIsolate();
    } catch (e) {
      emit(GetInTouchError());
    }
  }

  Future<void> createIsolate() async {
    try {
      worker.postMessage({'type': 'getGetInTouch'});

      worker.onMessage.listen((message) {
        if (message != null) {
          List<GetInTouch> listGetInTouch = [];
          List<dynamic> list = jsonDecode(message.data);
          for (var e in list) {
            listGetInTouch.add(GetInTouch.fromMap(e));
          }
          emit(GetInTouchLoaded(listGetInTouch: listGetInTouch));
        } else {
          emit(GetInTouchError());
        }
        worker.terminate();
      });
    } catch (e) {
      print(e);
    }
  }
}
