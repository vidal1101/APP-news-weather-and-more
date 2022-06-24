import 'package:flutter/material.dart';
import 'package:news_app/atomic/theme/tema.dart';
import 'package:news_app/providers/movie_providers.dart';
import 'package:news_app/services/new_service.dart';
import 'package:news_app/services/services_weather.dart';
import 'package:news_app/widget/splahscreen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // genere un mainprovider para las rutas
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( 
      providers: [
        ChangeNotifierProvider(create: (_) => new New_Service() ),
        Provider<MoviesProviders>(create: (_)=> MoviesProviders(),),
        Provider<ServiceWeather>(create: (_)=> ServiceWeather() ,),
      ],
          child: MaterialApp(
        theme: mitemaGlobal,
        debugShowCheckedModeBanner: false,
        //initialRoute: '/',
        home: Splah(),
      ),
    );
  }
}

