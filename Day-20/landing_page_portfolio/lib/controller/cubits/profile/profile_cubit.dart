import 'dart:convert';
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/back_end/profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final worker = Worker('worker.js');

  ProfileCubit() : super(ProfileInitial());

  void getProfile() {
    emit(ProfileLoading());
    createIsolate();
  }

  Future<void> createIsolate() async {
    try {
      worker.postMessage({'type': 'getProfile'});

      worker.onMessage.listen((message) {
        if (message != null) {
          emit(ProfileLoaded(
              profile: Profile.fromMap(jsonDecode(message.data))));
        } else {
          emit(ProfileError());
        }
        worker.terminate();
      });
    } catch (e) {
      print(e);
    }
  }
}
