import 'package:bloc/bloc.dart';
import 'package:comic_book/data/remote/user_remote.dart';
import 'package:comic_book/models/remote/login/user_login_response_model.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class UserBloc extends Bloc<UserLoginEvent, UserState> {
  UserBloc() : super(const LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(const LoginLoadingState());

        UserLoginResponse? response = await UserRemote.getApiResponse(event.email, event.password);

        if (response != null) {
          if (response.resultOk) {
            emit(LoginResponseOkState(newResponse: response));
          } else {
            emit(const LoginErrorState());
          }
        } else {
          emit(const LoginErrorState());
        }
      } catch (e) {
        emit(const LoginErrorState());
      }
    });
  }
}
