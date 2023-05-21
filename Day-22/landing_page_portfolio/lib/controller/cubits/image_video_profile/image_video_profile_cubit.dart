import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_video_profile_state.dart';

class ImageVideoProfileCubit extends Cubit<ImageVideoProfileState> {
  ImageVideoProfileCubit() : super(ImageVideoProfileInitial());

  void getListVideo() {
    emit(ImageVideoLoading());
    try {
      createIsolate();
    } catch (e) {
      emit(ImageVideoError());
    }
  }

  Future<void> createIsolate() async {
    try {
      final worker = Worker('worker.js');

      worker.postMessage({'type': 'getImageVideoProfile'});

      worker.onMessage.listen((message) {
        if (message != null) {
          List<String> listVideo = [];
          var list = jsonDecode(message.data);
          for (var e in list) {
            listVideo.add(e['source']);
          }
          emit(ImageVideoLoaded(listVideo: listVideo));
        } else {
          emit(ImageVideoError());
        }
        worker.terminate();
      });
    } catch (e) {
      print(e);
    }
  }
}
