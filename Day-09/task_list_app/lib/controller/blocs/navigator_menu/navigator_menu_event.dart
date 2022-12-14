// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigator_menu_bloc.dart';

class NavigatorMenuEvent extends Equatable {
  const NavigatorMenuEvent();

  @override
  List<Object> get props => [];
}

class ClickMenuEvent extends NavigatorMenuEvent {
  final int indexMenu;
  const ClickMenuEvent({required this.indexMenu});

  @override
  List<Object> get props => [indexMenu];
}
