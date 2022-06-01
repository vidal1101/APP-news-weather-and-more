import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {

  /**
   * variable local en la cual asingo los valores de texto
   * luego cambio el User, por un usuario.
   */
  var columnText = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 15,), 
      Text(
        "Hi User",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 15,), 
      Text(
        "¿What do you want to do today?",
        textAlign: TextAlign.center,
         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ],
  );



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        alignment: Alignment.topCenter,
        child: columnText,
      ),
    );
  }
}
