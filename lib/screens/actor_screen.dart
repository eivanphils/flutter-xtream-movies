import 'package:flutter/material.dart';
import 'package:flutter_xtream_movies/widgets/widgets.dart';

class ActorScreen extends StatelessWidget {
  const ActorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: Header(
        appBar: AppBar(),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            _PosterAndTitle(textTheme: textTheme),
            _OverView(textTheme: textTheme)
          ],
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: AssetImage('assets/loading.gif'),
            width: 100,
            height: 150,
            fit: BoxFit.cover),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'actor.name',
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Nacio el actor.birthday en actor.place_of_birth',
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
                  'actor.popularity.toString()',
                  style: textTheme.caption,
                )
              ],
            ),

            Chip(
              label: Text('actor.known_for_department')
            )
          ],
        ),
      ),
      
    ]);
  }
}

class _OverView extends StatelessWidget {
  final TextTheme textTheme;
  const _OverView({
    Key? key,
    required this.textTheme
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
          'Consequat quis amet id id. Nisi do id in mollit et est commodo. Fugiat labore officia consectetur laboris velit voluptate irure in ipsum elit. Mollit do sit et laborum commodo eiusmod esse cillum non esse.',
          style: textTheme.subtitle1,
          textAlign: TextAlign.justify,
        )
    );
  }
}
