import 'package:flutter/material.dart';

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
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Image(image: AssetImage('assets/empty.png'))),
          SizedBox(height: 10),
          Text('No se han realizado busquedas', style: TextStyle(fontSize: 16),),
        ],
      );
    }
    return Container();
  }
}
