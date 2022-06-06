import 'package:flutter/material.dart';


import 'package:flutter_xtream_movies/router/app_routes.dart';
import 'package:flutter_xtream_movies/widgets/widgets.dart';

class MoviesScreen extends StatelessWidget {
   
  const MoviesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        appBar: AppBar(),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.settingsRoute),
        ),
        widgets: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => print('searching'),
          ),
        ]
      ),
      body: Column(
        children: const [
          CardSwiper()
        ]
      )
    );
  }
}