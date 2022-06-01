import 'package:flutter/material.dart';
import 'package:news_app/widget/MainHome/background_home.dart';
import 'package:news_app/widget/MainHome/card_home.dart';
import 'package:news_app/widget/MainHome/page_title_home.dart';


class MainSplashHome extends StatefulWidget {

  @override
  State<MainSplashHome> createState() => _MainSplashHomeState();
}

class _MainSplashHomeState extends State<MainSplashHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          BackGroudHome(), // color y fonrmas de fondo
          _HomeBody(),// el cuerpo y opciones de la app
        ],
      ),
    );
  }
}


class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    const sizeHeight =  SizedBox(height: 30,);

    return SingleChildScrollView(
        child: Column(
          children: [
            //dar un espacio en la parte superior
            sizeHeight, 
            //los titulos del home
            PageTitle(), // totulo del home 
            sizeHeight,
            CardHomeTable(), // opciones del home body
          ],
        ) ,
    );
  }
}