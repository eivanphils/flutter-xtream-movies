import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_xtream_movies/models/models.dart';
import 'package:flutter_xtream_movies/providers/movies_provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const _EmptyResults();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: moviesProvider.searchMovies(query),
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) return const _EmptyResults();

          final movies = snapshot.data!;

          return ListView.separated(
              itemCount: movies.length,
              itemBuilder: (context, int index) {
                final movie = movies[index];
                movie.heroId = 'search-${movie.id}';
                return ListTile(
                  leading: Hero(
                    tag: movie.heroId!,
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.contain,
                      width: 60,
                    ),
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.originalTitle),
                  onTap: () =>
                      Navigator.pushNamed(context, 'detail', arguments: movie),
                );
              },
              separatorBuilder: (_, __) => const Divider());
        });
  }
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Image(image: AssetImage('assets/empty.png'))),
        SizedBox(height: 10),
        Text(
          'No se hay resultados',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
