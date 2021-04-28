import 'package:flutter/material.dart';
import 'package:news_app/widget/drawer_lateral.dart';

class SettingsPage extends StatelessWidget {
  static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      drawer: Drawer_Page(),
      body: Center(),
    );
  }
}
