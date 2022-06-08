import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_xtream_movies/providers/movies_provider.dart';
import 'package:flutter_xtream_movies/router/app_routes.dart';
import 'package:flutter_xtream_movies/widgets/widgets.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: Header(
            appBar: AppBar(),
            leading: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.settingsRoute),
            ),
            widgets: [
              IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () => print('searching'),
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            // Slider principal
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // Slider de peliculas
            MovieSlider(movies: moviesProvider.onPopularMovies),
          ]),
        ));
  }
}