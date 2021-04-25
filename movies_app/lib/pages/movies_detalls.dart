import 'package:flutter/material.dart';
import 'package:movies_app/models/movies_models.dart';

class Movie_Detalls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

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
            _description(pelicula),
            _description(pelicula),

            _description(pelicula),
            _description(pelicula),
            _description(pelicula),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FadeInImage(
              fadeInDuration: Duration(seconds: 1),
              placeholder: AssetImage('assets/backloading.gif'),
              image: NetworkImage(peli.getPosterImg()),
              fit: BoxFit.cover,
              height: 150.0,
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
      padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 10.0),
      child: Text(peli.overview.toString(),  style: TextStyle(fontWeight: FontWeight.w600),
      textAlign: TextAlign.justify,),
    );
  }
}
