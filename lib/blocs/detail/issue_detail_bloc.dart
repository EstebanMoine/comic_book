import 'package:bloc/bloc.dart';
import 'package:comic_book/data/remote/issue_detail_remote.dart';
import 'package:comic_book/models/remote/detail/comic_detail_response.dart';
import 'package:flutter/material.dart';

part 'issue_detail_event.dart';
part 'issue_detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const IssueDetailLoadingState()) {
    on<LoadDetailEvent>((event, emit) async {
      try {
        emit(const IssueDetailLoadingState());

        ComicDetailResponse? response = await IssueDetailRemote.getIssueDetail(event.apiDetailUrl);

        if (response != null) {
          emit(IssueDetailResponseOkState(newResponse: response));
        } else {
          emit(const IssueDetailErrorState());
        }
      } catch (e) {
        emit(const IssueDetailErrorState());
      }
    });
  }
}
