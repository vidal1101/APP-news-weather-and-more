import 'package:flutter/material.dart';


/**
 * 
 * una clase para colores en hexadecimales, 
 * se le eenvia el color en hexadecimal  y regresa para una propieda tipo color
 */
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}