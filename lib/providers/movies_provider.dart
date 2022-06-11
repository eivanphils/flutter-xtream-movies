import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_xtream_movies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'da667a4fafb64048d77c2deeecb0ed26';
  final String _language = 'es-ES';
  int _popularPage = 0;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};
  Map<int, PersonResponse> actorsInfo = {};

  MoviesProvider() {
    getMoviesNowPlaying();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);

    return response.body;
  }

  void getMoviesNowPlaying() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = nowPlayingResponseFromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  void getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = popularResponseFromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) {
      return moviesCast[movieId]!;
    }

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = creditsResponseFromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<PersonResponse> getActorInfo(int personId) async {
    if (actorsInfo.containsKey(personId)) {
      return actorsInfo[personId]!;
    }

    final jsonData = await _getJsonData('3/person/$personId');
    final personResponse = personResponseFromJson(jsonData);

    actorsInfo[personId] = personResponse;

    return personResponse;
  }

  Future<List<Video>> getTrailers(int movieId) async {
    final jsonData = await _getJsonData('3/movie/$movieId/videos');
    final videosResponse = videosResponseFromJson(jsonData);

    return videosResponse.results;
  }
}
