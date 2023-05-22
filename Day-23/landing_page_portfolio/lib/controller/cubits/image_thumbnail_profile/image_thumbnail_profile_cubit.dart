import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
        if (message != null) {
          List<ImageVideo> listVideo = [];
          var list = jsonDecode(message.data);
          print(list);
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
      print(e);
    }
  }
}
