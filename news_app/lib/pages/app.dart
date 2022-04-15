import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/providers/movie_providers.dart';
import 'package:news_app/services/new_service.dart';
import 'package:news_app/theme/tema.dart';
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
      ],
          child: MaterialApp(
        theme: mitemaGlobal,
        debugShowCheckedModeBanner: false,
        //initialRoute: '/',
        home: Home_Page(),
      ),
    );
  }
}

