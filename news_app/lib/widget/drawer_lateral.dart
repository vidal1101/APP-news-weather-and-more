import 'package:flutter/material.dart';
import 'package:news_app/pages/Weather_home_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/home_page_movies.dart';
import 'package:news_app/pages/setting.dart';
import 'package:news_app/theme/tema.dart';

class Drawer_Page extends StatelessWidget {
  const Drawer_Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          /**
           * cabecera de drawer
           */
          DrawerHeader(
              child: Row(
            children: <Widget>[
              avatarHeader(),
              nombreAvatarHeader(),
            ],
          )),

          /**
           * cuerpo del drawer 
           */
          ListTile(
            title: Text('News'),
            leading: Icon(
              Icons.fiber_new_sharp,
              color: mitemaGlobal.accentColor,
            ),
            trailing: trailing(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        Home_Page()), // Noticias en la sesccion de inicio
              );
            },
          ),
          ListTile(
            title: Text('Movies'),
            leading: Icon(
              Icons.movie_outlined,
              color: mitemaGlobal.accentColor,
            ),
            trailing: trailing(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HomePageMovies()), // peliculas
              );
            },
          ),
          ListTile(
            title: Text('Weather'),
            leading: Icon(
              Icons.wb_sunny_sharp,
              color: mitemaGlobal.accentColor,
            ),
            trailing: trailing(),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WeatherHomePage())); //  seccion de clima
            }, // seccion de clima que estaria en desarrollo
          ),
          ListTile(
            title: Text('Setting'),
            leading: Icon(
              Icons.settings,
              color: mitemaGlobal.accentColor,
            ),
            trailing: trailing(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SettingsPage()), // la opcion de configuraciones del sistema.
              );
            },
          ),
        ],
      ),
    );
  }

/*

  para poner la foto del usuario en el drawer, 
  jalada de assets a un assetimage, usando file 
*/
  Widget avatarHeader() {
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.all(3.0),
      margin: EdgeInsets.only(right: 35.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70.0),
          color: mitemaGlobal.accentColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: mitemaGlobal.accentColor,
              blurRadius: 12.5,
              spreadRadius: 2.3,
              offset: Offset(3.0, 10.0),
            )
          ]),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://oriettabock.com/wp-content/uploads/tiposrostrofemeninos.jpg'),
        radius: 50.0,
        child: Text(''),
      ),
    );
  }

/**
 * nombre que pone el usuaurio en setting para mostrarlo junto con su foto
 */
  Widget nombreAvatarHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      //color: Colors.red,
      child: Column(
        children: <Widget>[
          Text('Nombre:'),
          Text(
            'Angelina  Jolie',
            textAlign: TextAlign.left,
            overflow: TextOverflow.visible,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  /**
   * 
   * el icono de las flechas de ruta de cada parte  y acceso a una seccion. 
   */
  Widget trailing() {
    return Icon(
      Icons.arrow_forward_ios_rounded,
      color: mitemaGlobal.accentColor,
    );
  }
}
