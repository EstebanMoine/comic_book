import 'package:comic_book/cubits/configs/configs_cubit.dart';
import 'package:comic_book/blocs/issues/issues_bloc.dart';
import 'package:comic_book/ui/screens/home/dialogs/filter_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarFilterButton extends StatelessWidget {
  const AppBarFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final configsValue = context.watch<ConfigsCubit>();
    bool showText = MediaQuery.of(context).size.width <= 800;

    String text = configsValue.state.hasFilterApplied ? 'Remove search' : 'Search by name';

    return Tooltip(
      message: text,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (configsValue.state.hasFilterApplied) {
              configsValue.changeStateOfFilter();
              BlocProvider.of<IssuesBloc>(context, listen: false).add(LoadAllIssuesEvent());
            } else {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return const SearchNameDialog();
                },
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                if (!showText) ...[
                  Text(text),
                  const SizedBox(
                    width: 10,
                  ),
                ],
                Icon(
                  configsValue.state.hasFilterApplied ? Icons.clear : Icons.search,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
