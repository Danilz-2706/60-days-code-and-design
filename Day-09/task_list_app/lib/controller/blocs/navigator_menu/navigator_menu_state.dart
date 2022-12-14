part of 'navigator_menu_bloc.dart';

class NavigatorMenuState extends Equatable {
  final int indexMenu;
  const NavigatorMenuState({this.indexMenu = 0});

  @override
  List<Object> get props => [indexMenu];
}
