// To parse this JSON data, do
//
//     final personResponse = personResponseFromJson(jsonString);

import 'dart:convert';

PersonResponse personResponseFromJson(String str) => PersonResponse.fromJson(json.decode(str));

class PersonResponse {
    PersonResponse({
      required this.adult,
      required this.alsoKnownAs,
      required this.biography,
      required this.birthday,
      required this.deathday,
      required this.gender,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.knownForDepartment,
      required this.name,
      required this.placeOfBirth,
      required this.popularity,
      required this.profilePath,
    });

    bool adult;
    List<String> alsoKnownAs;
    String biography;
    DateTime birthday;
    dynamic deathday;
    int gender;
    String homepage;
    int id;
    String imdbId;
    String knownForDepartment;
    String name;
    String placeOfBirth;
    double popularity;
    String profilePath;

    factory PersonResponse.fromJson(Map<String, dynamic> json) => PersonResponse(
        adult: json["adult"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
    );
}
