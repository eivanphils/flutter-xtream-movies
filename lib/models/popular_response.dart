// To parse this JSON data, do
//
//     final popularResponse = popularResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_xtream_movies/models/models.dart';

PopularResponse popularResponseFromJson(String str) => PopularResponse.fromJson(json.decode(str));

class PopularResponse {
    PopularResponse({
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory PopularResponse.fromJson(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}