part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class UploadImageEvent extends ImageEvent {
  final String folderName;

  const UploadImageEvent(this.folderName);
  @override
  List<Object> get props => [folderName];
}

class GetListImageEvent extends ImageEvent {
  final String folderName;

  const GetListImageEvent({required this.folderName});

  @override
  List<Object> get props => [folderName];
}
