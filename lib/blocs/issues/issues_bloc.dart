import 'package:bloc/bloc.dart';
import 'package:comic_book/data/remote/issues_remote.dart';
import 'package:flutter/material.dart';

import 'package:comic_book/models/remote/issues/comic_list_response.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  IssuesBloc() : super(const IssuesLoadingState()) {
    on<LoadAllIssuesEvent>((event, emit) async {
      try {
        emit(const IssuesLoadingState());

        String nameToFilter = event.nameToFilter ?? '';

        ComicListResponse? response = await IssuesRemote.getIssues(nameToFilter);

        if (response != null) {
          emit(IssuesResponseOkState(newResponse: response));
        } else {
          emit(const IssuesErrorState());
        }
      } catch (e) {
        emit(const IssuesErrorState());
      }
    });
  }
}
