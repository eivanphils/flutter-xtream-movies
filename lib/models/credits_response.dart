// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_xtream_movies/models/models.dart';

CreditsResponse creditsResponseFromJson(String str) => CreditsResponse.fromJson(json.decode(str));

class CreditsResponse {
    CreditsResponse({
      required this.id,
      required this.cast,
      required this.crew,
    });

    int id;
    List<Cast> cast;
    List<Cast> crew;

    factory CreditsResponse.fromJson(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
    );
}
