import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_xtream_movies/models/models.dart';
import 'package:flutter_xtream_movies/providers/movies_provider.dart';
import 'package:flutter_xtream_movies/widgets/widgets.dart';

class ActorScreen extends StatelessWidget {
  const ActorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    final personId =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString());

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: Header(
          appBar: AppBar(),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: moviesProvider.getActorInfo(personId),
              builder: (_, AsyncSnapshot<PersonResponse> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: CupertinoActivityIndicator(),
                  );
                }

                final actor = snapshot.data!;

                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      _PosterAndTitle(textTheme: textTheme, actor: actor),
                      _OverView(textTheme: textTheme, actor: actor)
                    ],
                  ),
                );
              }),
        ));
  }
}

class _PosterAndTitle extends StatelessWidget {
  final TextTheme textTheme;
  final PersonResponse actor;

  const _PosterAndTitle({
    Key? key,
    required this.actor,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(actor.fullProfileImg),
            width: 90,
            height: 140,
            fit: BoxFit.cover),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              actor.name,
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Born in ${actor.formatBirthday}',
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              actor.placeOfBirth,
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              children: [
                const Icon(Icons.star_border_outlined,
                    size: 15, color: Colors.grey),
                const SizedBox(width: 5),
                Text(
                  actor.popularity.toString(),
                  style: textTheme.caption,
                )
              ],
            ),
            Chip(label: Text(actor.knownForDepartment))
          ],
        ),
      ),
    ]);
  }
}

class _OverView extends StatelessWidget {
  final PersonResponse actor;
  final TextTheme textTheme;
  const _OverView({Key? key, required this.textTheme, required this.actor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          actor.biography,
          style: textTheme.subtitle1,
          textAlign: TextAlign.justify,
        ));
  }
}
