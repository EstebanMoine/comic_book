import 'package:comic_book/blocs/detail/issue_detail_bloc.dart';
import 'package:comic_book/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReloadDetailButton extends StatelessWidget {
  final String url;
  const ReloadDetailButton({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Reload detail',
      onPressed: () => BlocProvider.of<DetailBloc>(context, listen: false).add(LoadDetailEvent(apiDetailUrl: url)),
    );
  }
}
