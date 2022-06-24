
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/waether_models.dart';
import 'package:http/http.dart' as http;


final _URL_WEATHER = 'http://api.weatherapi.com/v1';
final _KEY_WEATHER = 'bd047363d8de43ed958205808221706';
final _Cuidad = 'lima';

class ServiceWeather  {

  List<dynamic> weatherlist = [];
  
  getweather() async {
    final url = "$_URL_WEATHER/current.json?key=$_KEY_WEATHER&q=$_Cuidad&aqi=yes";
    final response = await http.get(Uri.parse(url));
    
    final new_weather = weatherFromJson(response.body);

    print(new_weather.current.condition.icon.toString());
    
    weatherlist.add(new_weather);
   
  }


}