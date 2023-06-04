part of 'get_in_touch_cubit.dart';

abstract class GetInTouchState extends Equatable {
  const GetInTouchState();

  @override
  List<Object> get props => [];
}

class GetInTouchInitial extends GetInTouchState {}

class GetInTouchLoading extends GetInTouchState {}

class GetInTouchLoaded extends GetInTouchState {
  final List<GetInTouch> listGetInTouch;
  const GetInTouchLoaded({
    required this.listGetInTouch,
  });

  @override
  List<Object> get props => [listGetInTouch];
}

class GetInTouchError extends GetInTouchState {}
