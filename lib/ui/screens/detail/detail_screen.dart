import 'package:comic_book/blocs/detail/issue_detail_bloc.dart';
import 'package:comic_book/models/remote/issues/comic_model.dart';
import 'package:comic_book/ui/screens/detail/views/detail_view.dart';
import 'package:comic_book/ui/screens/detail/widgets/reload_detail_button.dart';
import 'package:comic_book/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  final Comic issue;

  const DetailScreen({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetailBloc>(context, listen: false).add(LoadDetailEvent(apiDetailUrl: issue.apiDetailUrl));

    return Content(comic: issue);
  }
}

class Content extends StatelessWidget {
  final Comic comic;
  const Content({
    super.key,
    required this.comic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(comic.getNameToShow()),
      ),
      body: HomeBody(
        comic: comic,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final Comic comic;
  const HomeBody({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is IssueDetailLoadingState) {
          return const CustomLoading();
        } else if (state is IssueDetailResponseOkState) {
          return DetailView(issueDetail: state.issuesResponse!.comicDetail);
        } else {
          return ReloadDetailButton(
            url: comic.apiDetailUrl,
          );
        }
      },
    );
  }
}
