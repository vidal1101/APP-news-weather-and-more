import 'package:flutter/material.dart';
import 'package:news_app/services/services_weather.dart';
import 'package:provider/provider.dart';

class Cities extends StatefulWidget {
  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<ServiceWeather>(context).getweather();
    final weatherlist = ServiceWeather().weatherlist;

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.toString()),
      ),
      body: FutureBuilder(
        future: weather,
        builder: (BuildContext context , AsyncSnapshot asyncSnapshot){
          return Center(child: Text(asyncSnapshot.data.toString() ));
        })
    );
  }
}
