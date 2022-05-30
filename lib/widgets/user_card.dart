import 'package:flutter/material.dart';
import 'package:flutter_xtream_movies/theme/app_theme.dart';

class UserCard extends StatelessWidget {
  final String image;
  final String name;

  const UserCard({
    Key? key,
    required this.image,
    required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, 'movies'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 20,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shadowColor: AppTheme.lightBlue,
              child: Image(
                image: AssetImage(image),
                height: 100,
                width: 100,
              ),
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
