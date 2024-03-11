import 'package:comic_book/blocs/issues/issues_bloc.dart';
import 'package:comic_book/ui/screens/home/views/issues_view.dart';
import 'package:comic_book/ui/screens/home/widgets/appbar_filter_button.dart';
import 'package:comic_book/ui/screens/home/widgets/appbar_switch_button.dart';
import 'package:comic_book/ui/shared/custom_loading.dart';
import 'package:comic_book/ui/screens/home/widgets/reload_issues_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<IssuesBloc>(context, listen: false).add(LoadAllIssuesEvent());

    return const Content();
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Comic Book - Latest issues',
        ),
        actions: const [
          AppBarFilterButton(),
          AppBarSwitchButton(),
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssuesBloc, IssuesState>(
      builder: (context, state) {
        if (state is IssuesLoadingState) {
          return const CustomLoading();
        } else if (state is IssuesResponseOkState) {
          return IssuesView(results: state.issuesResponse!.comics);
        } else {
          return const ReloadIssuesButton();
        }
      },
    );
  }
}
