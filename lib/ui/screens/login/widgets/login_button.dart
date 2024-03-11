import 'package:comic_book/blocs/login/login_bloc.dart';
import 'package:comic_book/cubits/forms/login_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginFormCubit = context.watch<LoginFormCubit>();

    return MaterialButton(
      color: Colors.white,
      child: const Text('LOGIN'),
      onPressed: () {
        BlocProvider.of<UserBloc>(context, listen: false).add(LoginEvent(
          email: loginFormCubit.state.email,
          password: loginFormCubit.state.password,
        ));
      },
    );
  }
}
