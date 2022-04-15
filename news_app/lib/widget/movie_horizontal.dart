import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news_app/models/movie_models.dart';
import 'package:news_app/pages/movies_detalls.dart';

class MoviesHorizobtal extends StatelessWidget {
  final List<Pelicula> peliculas;
  /**
   * esta funcion llama nuevamente a getpopualares y repite la peticion http, aumenta en 1 la pagina de 
   * resultados
   */
  final Function siguentePeliPopular;

  MoviesHorizobtal(
      {Key key, @required this.peliculas, @required this.siguentePeliPopular})
      : super(key: key);

  /**
   * el controller de la pageview , la pagina inicial, y la cantidad de elementos en pantalla
   */
  final PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.4);

  @override
  Widget build(BuildContext context) {
    final mediaq = MediaQuery.of(context).size;

    /**
     * cuando se acerca al final realiza la peticion,
     * asi inmediamenta las cargas las nuevas peliculas
     */
    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 250) {
        this.siguentePeliPopular();
      }
    });

    return Container(
      height: mediaq.height * 0.4,
      child: PageView.builder(
        pageSnapping: false, // mayor mobilidad al scrool del pageview.
        scrollDirection: Axis.horizontal,
        controller: controller,
        //children: _tarjets(),
        itemCount: peliculas.length,
        itemBuilder: (_, i) {
          return _tarjeta(_, peliculas[i]);
        },
      ),
    );
  }

  /**
   * una tarjeta a pintar de la pelicula a renderizar en el momento. 
   * 
   */
  Widget _tarjeta(BuildContext context, peli) {
    final _tarjeta = Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          Hero( // da un efecto de traslado de tarjeta, pero debe exittir el id para donde se translade 
            tag: peli.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: FadeInImage(
                fadeInDuration: Duration(seconds: 1),
                placeholder:
                    NetworkImage('https://suhsport.es/img/noImage.jpg'),
                image: NetworkImage(peli.getPosterImg()),
                fit: BoxFit.cover,
                height: 195.0,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            peli.title,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    return GestureDetector(
      child: _tarjeta,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Movie_Detalls(
                      pelicula: peli,
                    )));

        // Navigator.pushNamed(context, 'detalle' , arguments: peli);
      },
    );
  }
}
