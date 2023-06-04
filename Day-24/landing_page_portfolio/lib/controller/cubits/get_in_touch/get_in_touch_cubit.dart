import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/back_end/get_in_touch.dart';

part 'get_in_touch_state.dart';

class GetInTouchCubit extends Cubit<GetInTouchState> {
  final worker = Worker('worker.js');
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
        // ignore: unnecessary_null_comparison
        if (message != null) {
          List<GetInTouch> listGetInTouch = [];
          List<dynamic> list = jsonDecode(message.data);
          for (var e in list) {
            listGetInTouch.add(GetInTouch.fromMap(e));
          }
          listGetInTouch.sort((a, b) => a.number.compareTo(b.number));

          emit(GetInTouchLoaded(listGetInTouch: listGetInTouch));
        } else {
          emit(GetInTouchError());
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
