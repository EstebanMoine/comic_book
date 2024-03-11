import 'dart:convert';

import 'package:comic_book/models/remote/issues/comic_model.dart';

class ComicListResponse {
  final String error;
  final int limit;
  final int offset;
  final int numberOfPageResults;
  final int numberOfTotalResults;
  final int statusCode;
  final List<Comic> comics;
  final String version;

  const ComicListResponse({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.comics,
    required this.version,
  });

  factory ComicListResponse.fromRawJson(String str) => ComicListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComicListResponse.fromJson(Map<String, dynamic> json) => ComicListResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        comics: List<Comic>.from(json["results"].map((x) => Comic.fromJson(x))),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": List<dynamic>.from(comics.map((x) => x.toJson())),
        "version": version,
      };

  bool isOk() => error == 'OK';
}
