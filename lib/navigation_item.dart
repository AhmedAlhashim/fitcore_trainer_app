import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final Widget page;

  NavigationItem({required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
