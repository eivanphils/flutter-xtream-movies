import 'package:flutter/material.dart';
import 'package:flutter_xtream_movies/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: instancia de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar()
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