import 'package:flutter/material.dart';
import 'dart:math';


class BackGroudHome extends StatelessWidget {

  /**
   * propiedad para dar color de fondo al container, 
   * a traves de valores headecimales 
   */
  final boxDecoration = BoxDecoration(
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 21, 78, 153),
            Color(0xff202333),
          ]),
    );


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // color de fondo, purple con lineagradient 
        Container(decoration: boxDecoration),
        Positioned(
          top: -75,
          left: -30,
          child: _FormsHome()
          ),
      ],
    );
  }
}


/**
 * crea la forma con un container y con el widget tranform lo giro 
 * a voluntad, entre la propiedad de ; -pi / 4.0,  ahi le doy el angulo 
 * ñuego lo posiciono con positioned dentro del stack del backgrond . 
 * 
 */
class _FormsHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      
      angle: -pi / 4.0,
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 43, 139, 184),
            Color.fromARGB(255, 190, 61, 56),
          ]),
          
        ),
      ),
    );
  }
}