import 'package:flutter/material.dart';
import 'package:news_app/atomic/theme/tema.dart';
import 'package:news_app/pages/create_user_page.dart';
import 'package:news_app/pages/login_page.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widget/widget.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
        ChangeNotifierProvider(create: (_)=> AuthLoginFirebase()),

      ],
          child: MaterialApp(
        theme: mitemaGlobal,
        debugShowCheckedModeBanner: false,
        //initialRoute: '/',
        //home: Splah(),
        initialRoute: 'splash',
        routes: {
          'splash' : (_)=> Splah(),
          'login'  :(context) => LoginPage( key:  Key('login'),) ,
          'home'   : (context) =>  MainSplashHome(),
          'createUserNew': (context)=> CreateUSerNew(),
        },
      ),
    );
  }
}

