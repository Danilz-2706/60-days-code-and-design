part of 'image_bloc.dart';

class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class LoadingState extends ImageState {
  @override
  List<Object> get props => [];
}

class LoadedImageState extends ImageState {
  const LoadedImageState();

  @override
  List<Object> get props => [];
}

class ErrorImageState extends ImageState {
  final String error;
  const ErrorImageState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class UploadImageState extends ImageState {
  @override
  List<Object> get props => [];
}

class GetListImageState extends ImageState {
  final List<ImageFE> listImage;

  const GetListImageState({required this.listImage});
  @override
  List<Object> get props => [listImage];
}
