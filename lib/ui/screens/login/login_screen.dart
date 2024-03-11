import 'package:comic_book/blocs/login/login_bloc.dart';
import 'package:comic_book/cubits/forms/login_form_cubit.dart';
import 'package:comic_book/ui/screens/home/home_screen.dart';
import 'package:comic_book/ui/screens/login/views/login_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            child: BlocProvider(
              create: (context) => LoginFormCubit(),
              child: BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is LoginResponseOkState) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }
                },
                child: const LoginFormView(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
