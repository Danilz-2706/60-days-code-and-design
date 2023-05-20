// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;
  const ProfileLoaded({
    required this.profile,
  });

  @override
  List<Object> get props => [profile];
}

class ProfileError extends ProfileState {}
