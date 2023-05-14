import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/back_end/profile.dart';
import '../../services/firestore_service/profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService profileService;

  ProfileBloc({required this.profileService}) : super(const ProfileState()) {
    on<CreateEvent>(_createProfile);
    on<GetEvent>(_getProfile);
  }
  FutureOr<void> _createProfile(
      CreateEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      await profileService.create(profile: event.profile);
      emit(CreateProfileState());
    } catch (e) {
      emit(ErrorProfileState(error: e.toString()));
    }
  }

  FutureOr<void> _getProfile(GetEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());

    try {
      final data = await profileService.getProfile();
      if (kDebugMode) {
        print(data);
      }
      emit(LoadedProfileState(profile: data!));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrorProfileState(error: e.toString()));
    }
  }
}
