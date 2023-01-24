// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class LoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ProfileState {
  final Profile profile;
  const LoadedState({
    required this.profile,
  });

  @override
  List<Object> get props => [profile];
}

class ErrorState extends ProfileState {
  final String error;
  const ErrorState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class CreateState extends ProfileState {
  @override
  List<Object> get props => [];
}
