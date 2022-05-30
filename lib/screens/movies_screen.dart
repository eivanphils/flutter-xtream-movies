import 'package:flutter/material.dart';
import 'package:flutter_xtream_movies/router/app_routes.dart';
import 'package:flutter_xtream_movies/theme/app_theme.dart';

import 'package:flutter_xtream_movies/widgets/widgets.dart';

class MoviesScreen extends StatelessWidget {
   
  const MoviesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        appBar: AppBar(),
        widgets: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.settingsRoute),
            ),
          )
        ]
      ),
      body: const Center(
         child: Text('MoviesScreen'),
      ),
    );
  }
}