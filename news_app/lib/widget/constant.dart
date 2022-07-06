import 'package:flutter/material.dart';

/**
 * tema para para aplicar en los widget tipo scaffold 
 */
final mytheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Color.fromARGB(255, 219, 214, 214)
);

/**
 * expresion regular para evaluar un email 
 * con ciertos cararcteres especiales y validar en un textforfield 
 * 
 */
String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp  = new RegExp(pattern);
