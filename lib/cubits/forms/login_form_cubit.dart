import 'package:comic_book/models/local/login_form_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormCubit extends Cubit<LoginFormModel> {
  LoginFormCubit() : super(LoginFormModel(email: '', password: '', showPassword: false));

  void changeShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
}
