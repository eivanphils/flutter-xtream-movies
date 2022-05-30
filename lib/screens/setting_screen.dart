import 'package:flutter/material.dart';
import 'package:flutter_xtream_movies/widgets/widgets.dart';

class SettingsScreenScreen extends StatelessWidget {
   
  const SettingsScreenScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(appBar: AppBar()),
      body: const Center(
         child: Text('SettingsScreenScreen'),
      ),
    );
  }
}