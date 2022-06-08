// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_xtream_movies/models/models.dart';

NowPlayingResponse nowPlayingResponseFromJson(String str) => NowPlayingResponse.fromJson(json.decode(str));

class NowPlayingResponse {
    NowPlayingResponse({
      required this.dates,
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults,
    });

    Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory NowPlayingResponse.fromJson(Map<String, dynamic> json) => NowPlayingResponse(
        dates   : Dates.fromJson(json["dates"]),
        page    : json["page"],
        results : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages   : json["total_pages"],
        totalResults : json["total_results"],
    );
}

class Dates {
    Dates({
      required this.maximum,
      required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );
}
