// To parse this JSON data, do
//     final searchMovieResponse = searchMovieResponseFromMap(jsonString);
import 'dart:convert';
import 'package:news_app/models/movie_models.dart';

class SearchMovieResponse {
    SearchMovieResponse({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int page;
    List<Pelicula> results;
    int totalPages;
    int totalResults;

    factory SearchMovieResponse.fromJson(String str) => SearchMovieResponse.fromMap(json.decode(str));


    factory SearchMovieResponse.fromMap(Map<String, dynamic> json) => SearchMovieResponse(
        page: json["page"],
        results: List<Pelicula>.from(json["results"].map((x) => Pelicula.fromJsonMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}

