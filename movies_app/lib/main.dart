import 'package:flutter/material.dart';
import 'package:movies_app/pages/home_page.dart';
import 'package:movies_app/pages/movies_detalls.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/'       : (_)=> HomePage(),
        'detalle' : (_)=> Movie_Detalls(),

      },
    );
  }
}
