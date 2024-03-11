part of 'login_bloc.dart';

@immutable
abstract class UserLoginEvent {}

class LoginEvent extends UserLoginEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}
