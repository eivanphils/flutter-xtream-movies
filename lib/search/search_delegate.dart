import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => Navigator.pushNamed(context, 'movies'),
        icon: const Icon(Icons.search)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pushNamed(context, 'movies'),
      icon: const Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('results');

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('suggestions: $query');
  }
}
