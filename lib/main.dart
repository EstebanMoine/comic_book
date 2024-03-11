import 'package:comic_book/blocs/login/login_bloc.dart';
import 'package:comic_book/cubits/configs/configs_cubit.dart';
import 'package:comic_book/blocs/detail/issue_detail_bloc.dart';
import 'package:comic_book/blocs/issues/issues_bloc.dart';
import 'package:comic_book/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ConfigsCubit()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => IssuesBloc()),
        BlocProvider(create: (_) => DetailBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comic book',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 62, 58, 183),
          ),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
