import 'package:flutter/material.dart';
import 'package:news_app/models/category_modal.dart';
import 'package:news_app/models/new_models.dart';
import 'package:http/http.dart' as ht;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final API_KEY = '22d6a70138ee45089387164837697fc3';

class New_Service with ChangeNotifier {
  /**
   * se trae las primeras noticias
   */
  List<Article> headers = [];

/**
 * las categoria seleccionada
 */
  String _selectedCategoria = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.heart, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.footballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoriasNews = {};

/**
 * crea una sola instacia y pide la solucitud http 
 */
  New_Service() {
    this.gettopHeaderlines();

    categories.forEach((item) {
      this.categoriasNews[item.name] = new List();
    });
  }

/**
 * setter and getters de la categoria seleccionada
 */
  get getselectedCategoria => this._selectedCategoria;
  set selectedCategoria(String valor) {
    this._selectedCategoria = valor;

    this.getCategoriasNew(valor);
    notifyListeners();
  }

  List<Article> get getnewCategoriaSeleccionada =>
      this.categoriasNews[this.getselectedCategoria];

  gettopHeaderlines() async {
    final url = "$_URL_NEWS/top-headlines?apiKey=$API_KEY&country=us";
    final response = await ht.get(Uri.parse(url));
    final newRespon = newResponseFromJson(response.body);
    this.headers.addAll(newRespon.articles);
    notifyListeners();
  }

/**
 * se trae las noticias de la categoria seleccionada.
 */
  getCategoriasNew(String categoriaSele) async {
    final url =
        "$_URL_NEWS/top-headlines?apiKey=$API_KEY&country=us&category=$categoriaSele";
    final response = await ht.get(Uri.parse(url));
    final newRespon = newResponseFromJson(response.body);

    /**
     * se inicializa cuando se instancia por primera vez la clase,
     * carga las noticias de la categoria seleccionada, 
     */
    this.categoriasNews[categoriaSele].addAll(newRespon.articles);
/**  
 * al usar patron singleton, esto notifica a todo servidor que hay nuevas peticiones
 */
    notifyListeners();
  }
}
