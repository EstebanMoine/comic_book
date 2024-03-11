part of 'issues_bloc.dart';

@immutable
abstract class IssuesEvent {}

class LoadAllIssuesEvent extends IssuesEvent {
  final String? nameToFilter;
  LoadAllIssuesEvent({this.nameToFilter});
}
