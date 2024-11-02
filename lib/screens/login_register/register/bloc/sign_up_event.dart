part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {}

class SignUpClickedEvent extends SignUpEvent {
  final String email;
  final String phone;
  final String address;
  final String password;
  SignUpClickedEvent({
    required this.email,
    required this.phone,
    required this.address,
    required this.password,
  });
}
