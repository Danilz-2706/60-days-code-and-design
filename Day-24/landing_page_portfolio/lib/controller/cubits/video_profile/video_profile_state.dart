part of 'video_profile_cubit.dart';

abstract class VideoProfileState extends Equatable {
  const VideoProfileState();

  @override
  List<Object> get props => [];
}

class VideoProfileInitial extends VideoProfileState {}

class VideoProfileLoadingState extends VideoProfileState {}

class VideoProfileErrorState extends VideoProfileState {}

class GetVideoProfileState extends VideoProfileState {
  final ImageVideo video;
  const GetVideoProfileState({
    required this.video,
  });

  @override
  List<Object> get props => [video];
}
