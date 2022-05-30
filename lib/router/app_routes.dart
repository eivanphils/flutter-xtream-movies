import 'package:flutter/material.dart';

import 'package:flutter_xtream_movies/models/route_option.dart';
import 'package:flutter_xtream_movies/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static const String settingsRoute = 'settings';

  static final routes = <RouteOption>[
    RouteOption(name: 'home', route: 'home', screen: const HomeScreen()),
    RouteOption(name: 'movies', route: 'movies', screen: const MoviesScreen()),
    RouteOption(name: 'detail', route: 'detail', screen: const DetailsScreen()),
    RouteOption(name: 'settings', route: 'settings', screen: const SettingsScreenScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in routes) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
