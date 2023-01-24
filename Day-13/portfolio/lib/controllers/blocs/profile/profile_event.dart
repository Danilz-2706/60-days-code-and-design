// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class CreateEvent extends ProfileEvent {
  final Profile profile;
  const CreateEvent({
    required this.profile,
  });
  @override
  List<Object> get props => [profile];
}

class GetEvent extends ProfileEvent {
  const GetEvent();
  @override
  List<Object> get props => [];
}
