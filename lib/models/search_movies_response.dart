// To parse this JSON data, do
//
//     final searchMoviesResponse = searchMoviesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_xtream_movies/models/movie.dart';

SearchMoviesResponse searchMoviesResponseFromJson(String str) => SearchMoviesResponse.fromJson(json.decode(str));

class SearchMoviesResponse {
    SearchMoviesResponse({
      required  this.page,
      required  this.results,
      required  this.totalPages,
      required  this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory SearchMoviesResponse.fromJson(Map<String, dynamic> json) => SearchMoviesResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}