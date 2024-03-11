class ConfigsModel {
  bool showListView;
  bool hasFilterApplied;

  ConfigsModel({
    required this.showListView,
    required this.hasFilterApplied,
  });

  ConfigsModel copyWith({bool? newShowListView, bool? newHasFilter}) {
    return ConfigsModel(
      showListView: newShowListView ?? showListView,
      hasFilterApplied: newHasFilter ?? hasFilterApplied,
    );
  }
}
