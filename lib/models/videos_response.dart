// To parse this JSON data, do
//
//     final videosResponse = videosResponseFromJson(jsonString);

import 'dart:convert';

VideosResponse videosResponseFromJson(String str) => VideosResponse.fromJson(json.decode(str));

class VideosResponse {
    VideosResponse({
      required this.id,
      required this.results,
    });

    int id;
    List<Video> results;

    factory VideosResponse.fromJson(Map<String, dynamic> json) => VideosResponse(
        id: json["id"],
        results: List<Video>.from(json["results"].map((x) => Video.fromJson(x))),
    );

}

class Video {
    Video({
      required this.iso6391,
      required this.iso31661,
      required this.name,
      required this.key,
      required this.site,
      required this.size,
      required this.type,
      required this.official,
      required this.publishedAt,
      required this.id,
    });

    String iso6391;
    String iso31661;
    String name;
    String key;
    String site;
    int size;
    String type;
    bool official;
    DateTime publishedAt;
    String id;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
    );
}