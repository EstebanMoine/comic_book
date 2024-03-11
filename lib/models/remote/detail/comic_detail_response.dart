import 'dart:convert';

import 'package:comic_book/models/remote/detail/issue_detail_model.dart';

ComicDetailResponse issueDetailFromJson(String str) => ComicDetailResponse.fromJson(json.decode(str));

String issueDetailToJson(ComicDetailResponse data) => json.encode(data.toJson());

class ComicDetailResponse {
  final String error;
  final int limit;
  final int offset;
  final int numberOfPageResults;
  final int numberOfTotalResults;
  final int statusCode;
  final ComicDetail comicDetail;
  final String version;

  ComicDetailResponse({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.comicDetail,
    required this.version,
  });

  factory ComicDetailResponse.fromJson(Map<String, dynamic> json) => ComicDetailResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        comicDetail: ComicDetail.fromJson(json["results"]),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": comicDetail.toJson(),
        "version": version,
      };

  bool isOk() => error == 'OK';
}
