import 'package:flutter_bloc/flutter_bloc.dart';

part 'side_menu_state.dart';

class SideMenuCubit extends Cubit<SideMenuState> {
  SideMenuCubit() : super(SideMenuState(menu: 0));

  void chooseMenu(int choose) => emit(SideMenuState(menu: choose));
}
