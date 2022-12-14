// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigator_menu_event.dart';
part 'navigator_menu_state.dart';

class NavigatorMenuBloc extends Bloc<NavigatorMenuEvent, NavigatorMenuState> {
  NavigatorMenuBloc() : super(const NavigatorMenuState()) {
    on<ClickMenuEvent>(_clickMenu);
  }

  void _clickMenu(ClickMenuEvent event, Emitter<NavigatorMenuState> emit) {
    emit(NavigatorMenuState(indexMenu: event.indexMenu));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
