part of 'get_in_touch_bloc.dart';

abstract class GetInTouchEvent extends Equatable {
  const GetInTouchEvent();

  @override
  List<Object> get props => [];
}

class CreateGetInTouchEvent extends GetInTouchEvent {
  final GetInTouch getInTouch;

  const CreateGetInTouchEvent({required this.getInTouch});

  @override
  List<Object> get props => [getInTouch];
}

class GetAllGetInTouchEvent extends GetInTouchEvent {
  @override
  List<Object> get props => [];
}
