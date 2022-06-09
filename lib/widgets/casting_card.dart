import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:flutter_xtream_movies/models/models.dart';
import 'package:flutter_xtream_movies/providers/movies_provider.dart';

class CastingCard extends StatelessWidget {
  final int movieId;
  const CastingCard({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            width: double.infinity,
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 190,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => _CastCard(cast[index])),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard(this.actor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.fullProfileImg),
              height: 140,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${actor.name} (${actor.character})',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
