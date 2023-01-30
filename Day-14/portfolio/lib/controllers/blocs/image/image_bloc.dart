import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/firestore_service/image.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageService imageService;

  ImageBloc({required this.imageService}) : super(const ImageState()) {
    on<UploadImageEvent>(_uploadImage);
    on<GetListImageEvent>(_getListImage);
  }

  FutureOr<void> _uploadImage(
      UploadImageEvent event, Emitter<ImageState> emit) async {}

  FutureOr<void> _getListImage(
      GetListImageEvent event, Emitter<ImageState> emit) async {
    try {
      final list = await imageService.getImage(folderName: event.folderName);
      emit(GetListImageState(listImage: list));
    } catch (e) {
      emit(ErrorImageState(error: e.toString()));
    }
  }
}
