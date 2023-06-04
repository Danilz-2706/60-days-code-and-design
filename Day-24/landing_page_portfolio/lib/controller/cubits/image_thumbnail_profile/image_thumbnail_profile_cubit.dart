import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/font-end/image.dart';

part 'image_thumbnail_profile_state.dart';

class ImageThumbnailProfileCubit extends Cubit<ImageThumnailProfileState> {
  ImageThumbnailProfileCubit() : super(ImageThumbnailProfileInitial());

  void getListVideo() {
    emit(ImageThumnailLoading());
    try {
      createIsolate();
    } catch (e) {
      emit(ImageThumbnailError());
    }
  }

  Future<void> createIsolate() async {
    try {
      final worker = Worker('worker.js');

      worker.postMessage({'type': 'getImageVideoProfile'});

      worker.onMessage.listen((message) {
        // ignore: unnecessary_null_comparison
        if (message != null) {
          List<ImageVideo> listVideo = [];
          var list = jsonDecode(message.data);

          for (var e in list) {
            listVideo.add(ImageVideo.fromMap(e));
          }
          emit(ImageThumbnaiLoaded(listVideo: listVideo));
        } else {
          emit(ImageThumbnailError());
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
