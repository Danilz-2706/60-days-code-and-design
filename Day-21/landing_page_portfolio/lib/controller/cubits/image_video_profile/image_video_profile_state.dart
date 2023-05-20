part of 'image_video_profile_cubit.dart';

abstract class ImageVideoProfileState extends Equatable {
  const ImageVideoProfileState();

  @override
  List<Object> get props => [];
}

class ImageVideoProfileInitial extends ImageVideoProfileState {}

class ImageVideoInitial extends ImageVideoProfileState {}

class ImageVideoLoading extends ImageVideoProfileState {}

class ImageVideoLoaded extends ImageVideoProfileState {
  final List<String> listVideo;
  const ImageVideoLoaded({
    required this.listVideo,
  });

  @override
  List<Object> get props => [listVideo];
}

class ImageVideoError extends ImageVideoProfileState {}
