part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {
  const ProfileEvent();
}

class ProfileInitialEvent extends ProfileEvent {
  // final String userId;
  // const ProfileInitialEvent({
  //   required this.userId,
  // });
}
