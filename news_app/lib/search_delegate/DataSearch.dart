import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/models/movie_models.dart';
import 'package:news_app/providers/movie_providers.dart';
import 'package:news_app/pages/movies_detalls.dart';

class DataSearh extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "Search movie";

  @override
  List<Widget> buildActions(BuildContext context) {
    // las acciones de nuestro appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono a la parte izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Widget _emptyContainer() {
    return Container(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.white,
          size: 120,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // son las sugerencias que aparecen cuando la persona escribe ..
    if (query.isEmpty) {
      return _emptyContainer();
    } else {
      final movieresponse = Provider.of<MoviesProviders>(context, listen: false)
          .searchMovieResponse(query);

      return FutureBuilder(
        future: movieresponse,
        builder: (_, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (!snapshot.hasData) return _emptyContainer();
          final movies = snapshot.data;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, int index) => MovieResponse(
              movie: movies[index],
            ),
          );
        },
      );
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar
    return Container();
  }
}

class MovieResponse extends StatelessWidget {
  final Pelicula movie;

  const MovieResponse({this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: FadeInImage(
            placeholder: AssetImage("assets/backloading.gif"),
            image: NetworkImage(movie.getPosterImg()),
            width: 70,
            fit: BoxFit.contain,
          ),
          title: Text(
            movie.title,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(movie.originalTitle),
          onTap: () {
            print("presionado: " + movie.title);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Movie_Detalls(
                          pelicula: movie,  )));
          },
        ),
        Divider(
          color: Colors.lightBlue,
        )
      ],
    );
  }
}
