part of 'image_thumbnail_profile_cubit.dart';

abstract class ImageThumnailProfileState extends Equatable {
  const ImageThumnailProfileState();

  @override
  List<Object> get props => [];
}

class ImageThumbnailProfileInitial extends ImageThumnailProfileState {}

class ImageThumnailInitial extends ImageThumnailProfileState {}

class ImageThumnailLoading extends ImageThumnailProfileState {}

class ImageThumbnaiLoaded extends ImageThumnailProfileState {
  final List<ImageVideo> listVideo;
  const ImageThumbnaiLoaded({
    required this.listVideo,
  });

  @override
  List<Object> get props => [listVideo];
}

class ImageThumbnailError extends ImageThumnailProfileState {}
