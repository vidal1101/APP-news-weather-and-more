import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news_app/models/movie_models.dart';

class SwiperTarjet extends StatelessWidget {
  /*Arrays tipo dynamic que se valida en  el contructor para que entre null
   */
  final List<Pelicula> peliculas;

  SwiperTarjet({Key key, @required this.peliculas})
      : assert(peliculas != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sizeDevice = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 7.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemCount: this.peliculas.length,
        itemWidth: _sizeDevice.width * 0.8,
        itemHeight: _sizeDevice.height * 0.8,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: FadeInImage(
              fadeInDuration: Duration(seconds: 1),
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(peliculas[index].getPosterImg()),
              fit: BoxFit.cover,
            ),
          );
        },
       //pagination: new SwiperPagination(),
      //control: new SwiperControl(),
      ),
    );
  }
}
