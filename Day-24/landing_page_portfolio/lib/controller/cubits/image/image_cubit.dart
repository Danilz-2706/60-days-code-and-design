import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/font-end/image.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  final worker = Worker('worker.js');

  void getListImage(String folderName, List<String>? size) {
    emit(ImageLoading());
    try {
      createIsolate(folderName, size);
    } catch (e) {
      emit(ImageError());
    }
  }

  Future<void> createIsolate(String folderName, List<String>? size) async {
    try {
      worker.postMessage(
          {'type': 'getImage', 'folderName': folderName, 'size': size});

      worker.onMessage.listen((message) {
        // ignore: unnecessary_null_comparison
        if (message != null) {
          List<ImageVideo> listImage = [];
          var list = jsonDecode(message.data);
          for (var e in list) {
            listImage.add(ImageVideo.fromMap(e));
          }
          emit(ImageLoaded(listImage: listImage));
        } else {
          emit(ImageError());
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
