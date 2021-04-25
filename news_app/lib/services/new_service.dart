import 'package:flutter/material.dart';
import 'package:news_app/models/new_models.dart';
import 'package:http/http.dart' as ht;
import 'dart:async';
import 'dart:convert';

final _URL_NEWS = 'https://newsapi.org/v2';
final API_KEY = '22d6a70138ee45089387164837697fc3';

class New_Service with ChangeNotifier {
  List<Article> headers = [];

  New_Service() {
    this.gettopHeaderlines();
  }

  gettopHeaderlines() async {
    final url = "$_URL_NEWS/top-headlines?apiKey=$API_KEY&country=mx";
    final response = await ht.get(Uri.parse(url));
    final newRespon = newResponseFromJson(response.body);
    this.headers.addAll(newRespon.articles);
    notifyListeners();
  }
}
