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
  final List<String>? size;

  const GetListImageEvent({required this.folderName, this.size});

  @override
  List<Object> get props => [folderName, size!];
}
