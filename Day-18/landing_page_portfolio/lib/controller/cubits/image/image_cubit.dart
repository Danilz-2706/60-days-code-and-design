import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/font-end/image.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final worker = Worker('lib/worker.js');
  ImageCubit() : super(ImageInitial());

  void getListImage() {
    emit(ImageLoading());
    try {
      createIsolate();
    } catch (e) {
      emit(ImageError());
    }
  }

  Future<void> createIsolate() async {
    try {
      worker.postMessage({'type': 'getWork'});

      worker.onMessage.listen((message) {
        if (message != null) {
          List<ImageFE> listImage = [];
          List<dynamic> list = jsonDecode(message.data);
          for (var e in list) {
            listImage.add(ImageFE.fromMap(e));
          }
          emit(ImageLoaded(listImage: listImage));
        } else {
          emit(ImageError());
        }
        worker.terminate();
      });
    } catch (e) {
      print(e);
    }
  }
}
