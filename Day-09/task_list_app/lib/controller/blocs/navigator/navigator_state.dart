part of 'navigator_bloc.dart';

abstract class NavigatorState extends Equatable {
  const NavigatorState();
  
  @override
  List<Object> get props => [];
}

class NavigatorInitial extends NavigatorState {}
