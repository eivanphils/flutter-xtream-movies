import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_xtream_movies/models/movies_request.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('MoviesProvider inicializado');

    getMoviesNowPlaying();
  }

  getMoviesNowPlaying() async {
    print('getNowPlaying');

    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=da667a4fafb64048d77c2deeecb0ed26&language=en-ES&external_source=imdb_id');

    http.get(url).then((response) {
      final reqResRespuesta = moviesRequestFromJson(response.body);

      print(reqResRespuesta);
      print('dates: ${reqResRespuesta.dates}');
      print('totalPages: ${reqResRespuesta.totalPages}');
      print('totalResults: ${reqResRespuesta.totalResults}');
      print('result[0]: ${reqResRespuesta.results[0].adult}');
    });
    
  
    /* ejemplo con el await
    final url = Uri.https(
      'api.themoviedb.org',
      '3/movie/now_playing',
      {
        'api_key': 'da667a4fafb64048d77c2deeecb0ed26',
        'language': 'en-ES',
        'page': '1'
      }
    );
    final response = await http.get(url);
    final reqResRespuesta = moviesRequestFromJson(response.body);


    print(reqResRespuesta);
    print('dates: ${reqResRespuesta.dates}');
    print('totalPages: ${reqResRespuesta.totalPages}');
    print('totalResults: ${reqResRespuesta.totalResults}');
    print('result[0]: ${reqResRespuesta.results[0].adult}');
    */
  }
}
