import 'package:flutter/material.dart';

import 'package:flutter_xtream_movies/theme/app_theme.dart';
import 'package:flutter_xtream_movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      appBar: Header(
        appBar: AppBar()
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Titulo central del home
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Who's Watching?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
            ),
          ),
      
          // Cards de usuarios
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserCard(image: 'assets/queen.png', name: 'The Queen'),
              UserCard(image: 'assets/anakin.png', name: 'Anakin'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserCard(image: 'assets/princess.png', name: 'The princess'),
              UserCard(image: 'assets/dark.png', name: 'Dark'),
            ],
          )
        ],
      ),
    );
  }
}
