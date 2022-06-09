import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_xtream_movies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'da667a4fafb64048d77c2deeecb0ed26';
  final String _language = 'en-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    getMoviesNowPlaying();
    getPopularMovies();
  }

  void getMoviesNowPlaying() async {
    final url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : '1'
    });

    final response = await http.get(url);
    final nowPlayingResponse = nowPlayingResponseFromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  void getPopularMovies() async {
    final url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : '1'
    });

    final response = await http.get(url);
    final popularResponse = popularResponseFromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}
