import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final List<Widget>? widgets;

  const Header(
      {Key? key,
      required this.appBar,
      this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Image(
        image: AssetImage('assets/xtream.png'),
        width: 100,
        
      ),
      actions: widgets,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
