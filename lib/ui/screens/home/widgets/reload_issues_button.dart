import 'package:comic_book/blocs/issues/issues_bloc.dart';
import 'package:comic_book/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReloadIssuesButton extends StatelessWidget {
  const ReloadIssuesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Reload issues',
      onPressed: () => BlocProvider.of<IssuesBloc>(context, listen: false).add(LoadAllIssuesEvent()),
    );
  }
}
