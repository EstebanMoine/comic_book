import 'package:comic_book/blocs/login/login_bloc.dart';
import 'package:comic_book/cubits/forms/login_form_cubit.dart';
import 'package:comic_book/ui/screens/login/widgets/login_button.dart';
import 'package:comic_book/ui/shared/custom_loading.dart';
import 'package:comic_book/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginFormCubit = context.watch<LoginFormCubit>();

    return Container(
      width: 400,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.person,
            size: 80,
          ),
          const Text('WELCOME!'),
          const CustomText(
            text: '(Fake Login, enter any email and password and continue)',
            textAlign: TextAlign.center,
          ),
          const Divider(),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              hintText: '',
              labelText: 'Email',
              labelStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.email),
            ),
            onChanged: (value) {
              loginFormCubit.state.email = value;
            },
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            autocorrect: false,
            obscureText: !loginFormCubit.state.showPassword,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              hintText: '',
              labelText: 'Password',
              labelStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                icon: loginFormCubit.state.showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                onPressed: () {
                  loginFormCubit.changeShowPassword();
                },
              ),
              prefixIcon: const Icon(Icons.lock),
            ),
            onChanged: (value) => loginFormCubit.state.password = value,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is LoginLoadingState) {
                  return const CustomLoading();
                }
                return const Column(
                  children: [
                    LogInButton(),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
