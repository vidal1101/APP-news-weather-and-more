import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/home_page_movies.dart';
import 'package:news_app/pages/setting.dart';
import 'package:news_app/theme/tema.dart';

class Drawer_Page extends StatelessWidget {
  const Drawer_Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'http://es.web.img2.acsta.net/newsv7/20/03/17/13/00/1542770.jpg'),
              fit: BoxFit.cover,
            )),
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
                MaterialPageRoute(builder: (context) => Home_Page()),
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
                MaterialPageRoute(builder: (context) => HomePageMovies() ),
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
            onTap: () {},
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
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }

   Widget trailing() {
    return Icon(
      Icons.arrow_forward_ios_rounded,
      color: mitemaGlobal.accentColor,
    );
  }
}
