// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class LoadingProfileState extends ProfileState {
  @override
  List<Object> get props => [];
}

class LoadedProfileState extends ProfileState {
  final Profile profile;
  const LoadedProfileState({
    required this.profile,
  });

  @override
  List<Object> get props => [profile];
}

class ErrorProfileState extends ProfileState {
  final String error;
  const ErrorProfileState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class CreateProfileState extends ProfileState {
  @override
  List<Object> get props => [];
}
