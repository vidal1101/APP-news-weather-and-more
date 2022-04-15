import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:news_app/models/actores_movies_model.dart';
import 'dart:convert';
import 'dart:async';

import 'package:news_app/models/movie_models.dart';
import 'package:news_app/models/search_movie_response.dart';

class MoviesProviders {
  String _url = "api.themoviedb.org";
  String _apiKey = "f86866d7c89bbc7ed9a8ce041c624447";
  String _lenguaje = "es-ES";
  int _popularespages = 1;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  /**
   * creando stream para patron bloc 
   */

  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void closeStream() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesingReponse(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

/*Metodo que hace la peticion http a la API y regresa un future con todas 
las peliculas listas para ser usadas en la app. 
 */
  Future<List<Pelicula>> getInCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _lenguaje,
    });

    return await _procesingReponse(url);
  }

/*hace una peticion Get  a  la API, la cual regresa un json para decodificar en la 
 * clase pelicula. 
 */
  Future<List<Pelicula>> getPopulars() async {
    if (_cargando) return [];
    _cargando = true;
    print('cargando siguente....');
    this._popularespages++;
    final urlPopular = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _lenguaje,
      'page': this._popularespages.toString(),
    });

    final response = await _procesingReponse(urlPopular);
    this._populares.addAll(response);

    popularesSink(this._populares);

    _cargando = false;
    return response;
  }


  Future<List<Actor>> getActores (String peliId) async{

    final url = Uri.https(_url, '3/movie/$peliId/credits',{
      'api_key': _apiKey,
      'language': _lenguaje,
    });

    final response = await http.get(url);
    final decodeData  = json.decode(response.body);

    final cast = new Actores.fromJsonList(decodeData['cast']);

    return cast.actoresMovie;



  }


   Future<List<Pelicula>> searchMovieResponse(String query) async {

    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apiKey,
      'language': _lenguaje,
      'query' : query,
    });

    final response = await http.get(url);
    final searchResponse  = SearchMovieResponse.fromJson(response.body);

    return searchResponse.results;
  } 



/**------------------------------------------------------------------------------------- */
  Future<dynamic> getData() async {
    this._popularespages++;
    String url = "api.thecatapi.com";
    final urlget = Uri.https(url, 'v1/categories');
    final resp = await http.get(urlget);
    final dataDecode = json.decode(resp.body);
    print(dataDecode);
    return jsonDecode(resp.body);
  }
}
