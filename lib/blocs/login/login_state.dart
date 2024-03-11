part of 'login_bloc.dart';

@immutable
abstract class UserState {
  final bool loading;
  final UserLoginResponse? userLoginResponse;

  const UserState({
    this.userLoginResponse,
    this.loading = true,
  });
}

class LoginErrorState extends UserState {
  const LoginErrorState() : super(loading: false);
}

class LoginInitialState extends UserState {
  const LoginInitialState() : super(loading: false);
}

class LoginLoadingState extends UserState {
  const LoginLoadingState() : super(loading: true);
}

class LoginResponseOkState extends UserState {
  final UserLoginResponse newResponse;
  const LoginResponseOkState({
    required this.newResponse,
  }) : super(
          userLoginResponse: newResponse,
          loading: false,
        );
}
