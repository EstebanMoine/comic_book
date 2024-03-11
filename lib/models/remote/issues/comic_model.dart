import 'dart:convert';

import 'package:comic_book/models/remote/issues/comic_image_model.dart';
import 'package:comic_book/utils/date_utils.dart';

class Comic {
  final String apiDetailUrl;
  final DateTime dateAdded;
  final int id;
  final ComicImage comicImage;
  final String issueNumber;
  final String name;
  final String siteDetailUrl;

  Comic({
    this.apiDetailUrl = '',
    required this.dateAdded,
    required this.id,
    required this.comicImage,
    this.issueNumber = '',
    required this.name,
    this.siteDetailUrl = '',
  });

  factory Comic.fromRawJson(String str) => Comic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        apiDetailUrl: json["api_detail_url"],
        dateAdded: DateTime.parse(json["date_added"]),
        id: json["id"],
        comicImage: ComicImage.fromJson(json["image"]),
        issueNumber: json["issue_number"],
        name: json["name"] ?? 'No name found',
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "date_added": dateAdded.toIso8601String(),
        "id": id,
        "image": comicImage.toJson(),
        "issue_number": issueNumber,
        "name": name,
        "site_detail_url": siteDetailUrl,
      };

  String getNameToShow() {
    String nameToShow = '$issueNumber - $name';
    return nameToShow.length > 60 ? '${nameToShow.substring(0, 60)}...' : nameToShow;
  }

  String getDateAdded() => MyDateUtils.getFormattedDate(dateAdded);
}
