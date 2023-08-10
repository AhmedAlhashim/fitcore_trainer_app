import 'package:flutter/material.dart';
import 'navigation_item.dart';
import 'push_ups_page.dart';
import 'plank_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          NavigationItem(title: 'Push Ups', page: PushUpsPage()),
          NavigationItem(title: 'Plank', page: PlankPage()),
        ],
      ),
    );
  }
}
