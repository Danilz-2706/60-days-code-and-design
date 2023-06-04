part of 'image_cubit.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<ImageVideo> listImage;
  const ImageLoaded({
    required this.listImage,
  });

  @override
  List<Object> get props => [listImage];
}

class ImageError extends ImageState {}
