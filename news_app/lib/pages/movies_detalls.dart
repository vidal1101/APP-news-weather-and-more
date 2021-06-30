import 'package:flutter/material.dart';
import 'package:news_app/models/actores_movies_model.dart';
import 'package:news_app/models/movie_models.dart';
import 'package:news_app/providers/movie_providers.dart';
import 'package:news_app/theme/tema.dart';

class Movie_Detalls extends StatelessWidget {
  //objeto pelicula
  final Pelicula pelicula;

  //contructor de la clase
  Movie_Detalls({Key key, @required this.pelicula}) : super(key: key);

/**
 * el controller de la lista de actores
 * viewport.. fracciona cuantas page view se veran al inicio, segun el espacio indicado.
 * el initial, la pageview donde inicia cada vez que muestra informacion. 
 */
  PageController _pageController = new PageController(
    viewportFraction: 0.3,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    /**
     * 
     * efecto tipo resorte,
     * en los actores
     */
    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.maxScrollExtent) {
        _pageController.position.animateTo(
          _pageController.position.maxScrollExtent - s.width * 0.35,
          duration: Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
        );
      }
      if (_pageController.position.pixels ==
          _pageController.position.minScrollExtent) {
        _pageController.position.animateTo(
          s.width * 0.3,
          duration: Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
        );
      }
    });

    //final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(pelicula),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 15.0,
            ),
            _postertitle(pelicula),
            _description(pelicula),
            // _description(pelicula),

            _actoresMovie(pelicula),
          ])),
        ],
      ),
    );
  }

  Widget _crearAppbar(Pelicula peli) {
    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 300.0,
      backgroundColor: Colors.indigo,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(peli.title),
        background: FadeInImage(
          fadeInDuration: Duration(seconds: 3),
          placeholder: AssetImage('assets/backloading.gif'),
          image: NetworkImage(peli.getBackGroundImg()),
          //fit: BoxFit.fill,
          //height: 195.0,
        ),
      ),
    );
  }

  Widget _postertitle(Pelicula peli) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: peli.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                fadeInDuration: Duration(seconds: 1),
                placeholder: AssetImage('assets/backloading.gif'),
                image: NetworkImage(peli.getPosterImg()),
                fit: BoxFit.cover,
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                peli.originalTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Popularity: ' + peli.popularity.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Lnaguaje: ' + peli.originalLanguage.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(Icons.star_rate_outlined),
                  Text(
                    peli.voteAverage.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _description(Pelicula peli) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        peli.overview.toString(),
        style: TextStyle(fontWeight: FontWeight.w600),
        textAlign: TextAlign.justify,
      ),
    );
  }

  /**
   * recibe la pelicula y llama a providers para trear la data, 
   * en este caso en un future, porque es un sola peticion y finita
   * 
   */
  Widget _actoresMovie(Pelicula peli) {
    final moviesProviders = new MoviesProviders();
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Actores',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Divider(
            color: mitemaGlobal.accentColor,
          ),
          FutureBuilder(
              future: moviesProviders.getActores(peli.id.toString()),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData)
                  return carruselActores(
                      snapshot.data); //la data que lleva, son los actores.
                else
                  return _progressIndicator();
              }),
        ],
      ),
    );
  }

  /**
   * llega la data de actores de la peticion para ser descompueta en un vista 
   */
  Widget carruselActores(List<Actor> actores) {
    return SizedBox(
      height: 250.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: actores.length,
        itemBuilder: (context, index) => _actorTarjeta(actores[index]),
      ),
    );
  }

  /**
   * muestra cada actor en un tarjeta
   */
  Widget _actorTarjeta(Actor actor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            '${actor.name}',
            style: TextStyle(fontSize: 20.0),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: FadeInImage(
                fadeInDuration: Duration(seconds: 1),
                placeholder: AssetImage('assets/backloading.gif'),
                image: NetworkImage(actor.getPosterImgProfileActor())),
          ),
        ],
      ),
    );
  }

/**
 * indicador de data en proceso.
 *  */
  Widget _progressIndicator() {
    return Container(
      height: 350.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 4.6,
              backgroundColor: Colors.deepPurple,
            ),
            //Text('LOADING MOVIES...'),
          ],
        ),
      ),
    );
  }
}
