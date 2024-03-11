part of 'issues_bloc.dart';

@immutable
abstract class IssuesState {
  final bool loading;
  final ComicListResponse? issuesResponse;

  const IssuesState({
    this.issuesResponse,
    this.loading = true,
  });
}

class IssuesErrorState extends IssuesState {
  const IssuesErrorState() : super(loading: false);
}

class IssuesLoadingState extends IssuesState {
  const IssuesLoadingState() : super(loading: true);
}

class IssuesResponseOkState extends IssuesState {
  final ComicListResponse newResponse;
  const IssuesResponseOkState({
    required this.newResponse,
  }) : super(
          issuesResponse: newResponse,
          loading: false,
        );
}
