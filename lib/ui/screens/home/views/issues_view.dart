import 'package:comic_book/cubits/configs/configs_cubit.dart';
import 'package:comic_book/models/remote/issues/comic_model.dart';
import 'package:comic_book/ui/screens/home/widgets/grid_item_coimic.dart';
import 'package:comic_book/ui/screens/home/widgets/list_item_comic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuesView extends StatelessWidget {
  final List<Comic> results;

  const IssuesView({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    final configValue = context.watch<ConfigsCubit>();

    if (configValue.state.showListView) {
      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListItemComic(
            comic: results[index],
          );
        },
      );
    } else {
      List<GridItemComic> listOfWidgets = [];
      for (var element in results) {
        listOfWidgets.add(
          GridItemComic(
            issue: element,
          ),
        );
      }

      return SingleChildScrollView(
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: listOfWidgets,
          ),
        ),
      );
    }
  }
}
