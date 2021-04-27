import 'package:flutter/material.dart';
import 'package:news_app/theme/tema.dart';

class DetallsNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: mitemaGlobal.accentColor,
        child: Text('detalles de la noticia '),
      ),
    );
  }
}
