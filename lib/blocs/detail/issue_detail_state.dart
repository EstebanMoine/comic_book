part of 'issue_detail_bloc.dart';

@immutable
abstract class DetailState {
  final bool loading;
  final ComicDetailResponse? issuesResponse;

  const DetailState({
    this.issuesResponse,
    this.loading = true,
  });
}

class IssueDetailErrorState extends DetailState {
  const IssueDetailErrorState() : super(loading: false);
}

class IssueDetailLoadingState extends DetailState {
  const IssueDetailLoadingState() : super(loading: true);
}

class IssueDetailResponseOkState extends DetailState {
  final ComicDetailResponse newResponse;
  const IssueDetailResponseOkState({
    required this.newResponse,
  }) : super(
          issuesResponse: newResponse,
          loading: false,
        );
}
