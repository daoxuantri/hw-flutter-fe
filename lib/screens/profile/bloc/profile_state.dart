part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

abstract class ProfileActionState extends ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedSuccessState extends ProfileState {
  // final ProfileDataModel profile;

  // const ProfileLoadedSuccessState({
  //   required this.profile,
  // });
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;

  const ProfileErrorState({
    required this.errorMessage,
  });
}
