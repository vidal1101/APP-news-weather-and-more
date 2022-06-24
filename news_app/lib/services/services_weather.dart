
import 'dart:convert';

import 'package:news_app/models/waether_models.dart';
import 'package:http/http.dart' as http;


final _URL_WEATHER = 'http://api.weatherapi.com/v1';
final _KEY_WEATHER = 'bd047363d8de43ed958205808221706';
final _Cuidad = 'lima';

class ServiceWeather  {

  
  Future<dynamic> getweather() async {
    final url = "$_URL_WEATHER/current.json?key=$_KEY_WEATHER&q=$_Cuidad&aqi=yes";
    final response = await http.get(Uri.parse(url));

    final citylocation = weatherFromMap(response.body);
    print(citylocation.location.country);
    return citylocation;
    
    
  }


}