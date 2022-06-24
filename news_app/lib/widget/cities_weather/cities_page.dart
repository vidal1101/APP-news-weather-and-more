import 'package:flutter/material.dart';
import 'package:news_app/atomic/theme/tema.dart';
import 'package:news_app/models/waether_models.dart';
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mitemaGlobal.accentColor,
        title: Text('Cities'),
      ),
      body: FutureBuilder(
        future: weather,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container();
        },
      ),
    );
  }


  Widget loadCitie(  loc )  {
    return ListView.builder(
      itemCount: loc.length,
      itemBuilder: (_, int index) {
        return ListTile( title: Text( loc[index].country.toString()), );
      }
    );
  }
}
