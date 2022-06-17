
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/waether_models.dart';
import 'package:http/http.dart' as http;


final _URL_WEATHER = 'http://api.weatherapi.com/v1';
final _KEY_WEATHER = 'bd047363d8de43ed958205808221706';
final _Cuidad = 'lima';

class ServiceWeather with ChangeNotifier {

  List<Current> current = [];
  
  getweather() async {
    final url = "$_URL_WEATHER/current.json?key=$_KEY_WEATHER&q=$_Cuidad&aqi=yes";
    final response = await http.get(Uri.parse(url));
     final decodeData  = json.decode(response.body);
     print(decodeData);
    //hasta aqui tiodo bien, arreglar la clase para la data

    final new_weather = weatherFromJson(decodeData);
    print(new_weather);
    this.current.addAll(new_weather.currentlist);
     //print(item);
    
    notifyListeners();
  }

  notifyListeners();

}