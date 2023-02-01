part of 'get_in_touch_bloc.dart';

class GetInTouchState extends Equatable {
  const GetInTouchState();

  @override
  List<Object> get props => [];
}

class LoadingGetInTouchState extends GetInTouchState {
  @override
  List<Object> get props => [];
}

class ErrorGetInTouchState extends GetInTouchState {
  final String error;
  const ErrorGetInTouchState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class CreateGetInTouchState extends GetInTouchState {
  @override
  List<Object> get props => [];
}

class GetAllGetInTouchState extends GetInTouchState {
  final List<GetInTouch> listGetInTouch;
  const GetAllGetInTouchState({
    required this.listGetInTouch,
  });

  @override
  List<Object> get props => [listGetInTouch];
}
