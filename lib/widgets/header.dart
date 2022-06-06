import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final List<Widget>? widgets;
  final Widget? leading;

  const Header(
      {Key? key,
      required this.appBar,
      this.widgets,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      centerTitle: true,
      title: const Image(
        image: AssetImage('assets/xtream.png'),
        width: 100,
        
      ),
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
