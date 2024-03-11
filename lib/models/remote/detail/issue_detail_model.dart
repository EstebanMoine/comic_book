import 'package:comic_book/models/remote/detail/image_detail_model.dart';
import 'package:comic_book/models/remote/detail/volume_detail_model.dart';

class ComicDetail {
  final String apiDetailUrl;
  final List<Volume> characterCredits;
  final List<Volume> locationCredits;
  final List<Volume> conceptCredits;
  final String description;
  final int id;
  final ImageDetail image;
  final String issueNumber;
  final String name;
  final List<Volume> personCredits;
  final String siteDetailUrl;
  final List<Volume> storyArcCredits;
  final List<Volume> teamCredits;

  ComicDetail({
    required this.apiDetailUrl,
    required this.characterCredits,
    required this.locationCredits,
    required this.conceptCredits,
    required this.description,
    required this.id,
    required this.image,
    required this.issueNumber,
    required this.name,
    required this.personCredits,
    required this.siteDetailUrl,
    required this.storyArcCredits,
    required this.teamCredits,
  });

  factory ComicDetail.fromJson(Map<String, dynamic> json) => ComicDetail(
        apiDetailUrl: json["api_detail_url"],
        characterCredits: List<Volume>.from(json["character_credits"].map((x) => Volume.fromJson(x))),
        locationCredits: List<Volume>.from(json["location_credits"].map((x) => Volume.fromJson(x))),
        conceptCredits: List<Volume>.from(json["concept_credits"].map((x) => Volume.fromJson(x))),
        description: json["description"] ?? '',
        id: json["id"],
        image: ImageDetail.fromJson(json["image"]),
        issueNumber: json["issue_number"],
        name: json["name"] ?? 'No name found',
        personCredits: List<Volume>.from(json["person_credits"].map((x) => Volume.fromJson(x))),
        siteDetailUrl: json["site_detail_url"],
        storyArcCredits: List<Volume>.from(json["story_arc_credits"].map((x) => Volume.fromJson(x))),
        teamCredits: List<Volume>.from(json["team_credits"].map((x) => Volume.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "character_credits": List<dynamic>.from(characterCredits.map((x) => x.toJson())),
        "location_credits": List<dynamic>.from(locationCredits.map((x) => x.toJson())),
        "concept_credits": List<dynamic>.from(conceptCredits.map((x) => x.toJson())),
        "description": description,
        "id": id,
        "image": image.toJson(),
        "issue_number": issueNumber,
        "name": name,
        "person_credits": List<dynamic>.from(personCredits.map((x) => x.toJson())),
        "site_detail_url": siteDetailUrl,
        "story_arc_credits": List<dynamic>.from(storyArcCredits.map((x) => x.toJson())),
        "team_credits": List<dynamic>.from(teamCredits.map((x) => x.toJson())),
      };
}
