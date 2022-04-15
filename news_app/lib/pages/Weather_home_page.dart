import 'package:flutter/material.dart';

class WeatherHomePage extends StatefulWidget {

  WeatherHomePage({Key key}) : super(key: key);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Text('en proceso... '),
      ),
    );
  }
}
