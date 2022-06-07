import 'package:flutter/material.dart';
import 'package:flutter_xtream_movies/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: instancia de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              const _PosterAndTitle()
            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      backgroundColor: AppTheme.lightBlue,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black38,
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          )
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              fit: BoxFit.cover,
              width: 100,
              height: 150,
            ),
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text('movie.originalText', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),

              Row(
                children:[
                  const Icon(Icons.star_border_outlined, size: 15, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text('movie.voteAverage', style: textTheme.caption,)
                ],
              )
            ],
          )
        ]
      ),
    );
  }
}