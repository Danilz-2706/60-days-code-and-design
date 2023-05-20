import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
        if (message != null) {
          List<ImageFE> listImage = [];
          var list = jsonDecode(message.data);
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
