import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news_app/models/movie_models.dart';

class SwiperTarjet extends StatefulWidget {
  /*Arrays tipo dynamic que se valida en  el contructor para que entre null
   */
  final List<Pelicula> peliculas;

  SwiperTarjet({Key key, @required this.peliculas})
      : assert(peliculas != null),
        super(key: key);

  @override
  _SwiperTarjetState createState() => _SwiperTarjetState();
}

class _SwiperTarjetState extends State<SwiperTarjet> {
  @override
  Widget build(BuildContext context) {
    final _sizeDevice = MediaQuery.of(context).size;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scale(1.0, 1.0),
      /*
      el scale va de 0.0 a 1.0 
      donde el primer valor es X , Y la escalacion de acuerdo a cordenadas, solo afecta el pintado ,
      no la posicion de los widget. 
      */
      child: Container(
        padding: EdgeInsets.only(top: 7.0),
        child: Swiper(
          viewportFraction: 0.9,
          scale: 0.9,
          layout: SwiperLayout.STACK,
          itemCount: this.widget.peliculas.length,
          itemWidth: _sizeDevice.width * 0.8,
          itemHeight: _sizeDevice.height * 0.8,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: FadeInImage(
                fadeInDuration: Duration(seconds: 1),
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(widget.peliculas[index].getPosterImg()),
                fit: BoxFit.cover,
              ),
            );
          },
          //pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ),
      ),
    );
  }
}
