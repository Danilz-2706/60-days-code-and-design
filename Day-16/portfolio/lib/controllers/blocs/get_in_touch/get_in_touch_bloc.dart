import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/controllers/services/firestore_service/get_in_touch.dart';
import 'package:portfolio/models/back_end/get_in_touch.dart';

part 'get_in_touch_event.dart';
part 'get_in_touch_state.dart';

class GetInTouchBloc extends Bloc<GetInTouchEvent, GetInTouchState> {
  final GetInTouchService getInTouchService;

  GetInTouchBloc({required this.getInTouchService})
      : super(const GetInTouchState()) {
    on<CreateGetInTouchEvent>(_createGetInTouch);
    on<GetAllGetInTouchEvent>(_getAllGetInTouch);
  }

  FutureOr<void> _createGetInTouch(
      CreateGetInTouchEvent event, Emitter<GetInTouchState> emit) async {
    emit(LoadingGetInTouchState());
    try {
      await getInTouchService.create(getInTouch: event.getInTouch);
      emit(CreateGetInTouchState());
    } catch (e) {
      emit(ErrorGetInTouchState(error: e.toString()));
    }
  }

  FutureOr<void> _getAllGetInTouch(
      GetAllGetInTouchEvent event, Emitter<GetInTouchState> emit) async {
    emit(LoadingGetInTouchState());
    try {
      final list = await getInTouchService.getInTouch();
      emit(GetAllGetInTouchState(listGetInTouch: list));
    } catch (e) {
      emit(ErrorGetInTouchState(error: e.toString()));
    }
  }
}
