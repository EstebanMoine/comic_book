part of 'issue_detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class LoadDetailEvent extends DetailEvent {
  final String apiDetailUrl;
  LoadDetailEvent({required this.apiDetailUrl});
}
