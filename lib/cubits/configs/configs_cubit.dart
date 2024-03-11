import 'package:comic_book/models/local/configs_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigsCubit extends Cubit<ConfigsModel> {
  ConfigsCubit() : super(ConfigsModel(showListView: true, hasFilterApplied: false));

  void changeTypeOfView() {
    emit(state.copyWith(newShowListView: !state.showListView));
  }

  void changeStateOfFilter() {
    emit(state.copyWith(newHasFilter: !state.hasFilterApplied));
  }
}
