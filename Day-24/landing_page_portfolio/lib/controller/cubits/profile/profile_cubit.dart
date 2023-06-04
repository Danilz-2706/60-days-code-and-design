import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/back_end/profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getProfile() {
    emit(ProfileLoading());
    createIsolate();
  }

  Future<void> createIsolate() async {
    try {
      final worker = Worker('worker.js');

      worker.postMessage({'type': 'getProfile'});

      worker.onMessage.listen((message) {
        // ignore: unnecessary_null_comparison
        if (message != null) {
          emit(ProfileLoaded(
              profile: Profile.fromMap(jsonDecode(message.data))));
        } else {
          emit(ProfileError());
        }
        worker.terminate();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
