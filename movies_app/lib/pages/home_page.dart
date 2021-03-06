import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:movies_app/providers/movies_providers.dart';
import 'package:movies_app/widget/movie_horizontal.dart';
import 'package:movies_app/widget/swiper_tarjet.dart';

class HomePage extends StatelessWidget {
  final movieProvider = new MoviesProviders();

  @override
  Widget build(BuildContext context) {
    Padding padding = new Padding(padding: EdgeInsets.all(5.0));
    this.movieProvider.getPopulars();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Movies'),
        leading: Icon(Icons.search),
      ),
      drawer: Drawer(
        child: _drawerHeader(),
      ),
      body: ListView(
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          _swiperTarjet(),
          Divider(
            color: Colors.black87,
          ),
          _footer(),
        ],
      ),
    );
  }

/**
 * Crear las tarjetas de las peliculas que muestran su posterPath.
 */
  Widget _swiperTarjet() {
    return FutureBuilder(
      future: movieProvider.getInCines(),
      //initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData)
          return SwiperTarjet(peliculas: snapshot.data);
        else
          return _progressIndicator();
      },
    );
  }

  Widget _progressIndicator() {
    return Container(
      height: 350.0,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }


  Widget _drawerHeader(){
    return  ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Text"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Peliculas',
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Divider(
              color: Colors.redAccent,
            ),
            ListTile(
              title: Text(
                'Noticias',
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Divider(
              color: Colors.redAccent,
            ),
            ListTile(
              title: Text(
                'Clima',
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Divider(
              color: Colors.redAccent,
            ),
            ListTile(
              title: Text(
                'configuaraci??n',
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
  }




  Widget _footer() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          StreamBuilder(
              stream: movieProvider.popularesStream,
              //initialData: [],
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return MoviesHorizobtal(
                    peliculas: snapshot.data,
                    siguentePeliPopular: movieProvider.getPopulars,
                  );
                } else {
                  return _progressIndicator();
                }
              }),
        ],
      ),
    );
  }

/************************************************************************************ */
/*
Solo eran unas pruebas de otra API para mostrar datos. 
*/
  Widget _dataApi() {
    return FutureBuilder<dynamic>(
      future: movieProvider.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot);
          return ListView(children: listado(snapshot.data));
        } else {
          print("No hay informaci??n");
          return Text("Sin data");
        }
      },
      initialData: Center(child: CircularProgressIndicator()),
    );
  }

  List<Widget> listado(List<dynamic> info) {
    List<Widget> lista = [];
    info.forEach((elemento) {
      lista.add(Text(elemento["name"]));
    });
    return lista;
  }
}
