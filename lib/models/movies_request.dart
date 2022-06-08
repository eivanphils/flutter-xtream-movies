// To parse this JSON data, do
//
//     final moviesRequest = moviesRequestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_xtream_movies/models/movie_info.dart';

MoviesRequest moviesRequestFromJson(String str) => MoviesRequest.fromJson(json.decode(str));

String moviesRequestToJson(MoviesRequest data) => json.encode(data.toJson());

class MoviesRequest {
    MoviesRequest({
      required this.dates,
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults,
    });

    Dates dates;
    int page;
    List<MovieInfo> results;
    int totalPages;
    int totalResults;

    factory MoviesRequest.fromJson(Map<String, dynamic> json) => MoviesRequest(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<MovieInfo>.from(json["results"].map((x) => MovieInfo.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates.toJson(),
        "page": page,
        "results": List<MovieInfo>.from(results.map((x) => x)),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
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

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}
