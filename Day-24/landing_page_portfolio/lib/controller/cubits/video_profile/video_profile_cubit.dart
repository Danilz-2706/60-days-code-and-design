import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/font-end/image.dart';

part 'video_profile_state.dart';

class VideoProfileCubit extends Cubit<VideoProfileState> {
  VideoProfileCubit() : super(VideoProfileInitial());
  ImageVideo? checkVideo(String nameVideo) {
    for (var e in listSample) {
      if (e.name == nameVideo) {
        return e;
      }
    }
    return null;
  }

  List<ImageVideo> listSample = [];
  void getVideo(String nameVideo) {
    if (checkVideo(nameVideo) == null) {
      emit(VideoProfileLoadingState());
      try {
        createIsolate(nameVideo);
      } catch (e) {
        emit(VideoProfileErrorState());
      }
    } else {
      emit(VideoProfileLoadingState());

      emit(GetVideoProfileState(video: checkVideo(nameVideo)!));
    }
  }

  Future<void> createIsolate(String nameVideo) async {
    try {
      final worker = Worker('worker.js');

      worker.postMessage({'type': 'searchVideosByName', 'name': nameVideo});

      worker.onMessage.listen((message) {
        // ignore: unnecessary_null_comparison
        if (message != null) {
          var list = jsonDecode(message.data);
          listSample.add(ImageVideo.fromMap(list));
          emit(GetVideoProfileState(video: ImageVideo.fromMap(list)));
        } else {
          emit(VideoProfileErrorState());
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
