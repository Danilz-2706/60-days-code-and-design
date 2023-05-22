import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
      print("2" + checkVideo(nameVideo).toString());

      emit(GetVideoProfileState(video: checkVideo(nameVideo)!));
    }
  }

  Future<void> createIsolate(String nameVideo) async {
    try {
      final worker = Worker('worker.js');

      worker.postMessage({'type': 'searchVideosByName', 'name': nameVideo});

      worker.onMessage.listen((message) {
        if (message != null) {
          var list = jsonDecode(message.data);
          print("1" + ImageVideo.fromMap(list).toString());
          listSample.add(ImageVideo.fromMap(list));
          emit(GetVideoProfileState(video: ImageVideo.fromMap(list)));
        } else {
          emit(VideoProfileErrorState());
        }
        worker.terminate();
      });
    } catch (e) {
      print(e);
    }
  }
}
