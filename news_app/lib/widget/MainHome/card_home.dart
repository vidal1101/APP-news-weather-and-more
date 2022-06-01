import 'package:flutter/material.dart';
import 'package:news_app/pages/Weather_home_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/home_page_movies.dart';
import 'package:news_app/pages/setting.dart';

class CardHomeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            GestureDetector(
              child: _CardSingle(
                icon: Icons.newspaper_rounded,
                color: Color.fromARGB(255, 160, 47, 235),
                text: "News",
                secondText: "",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Home_Page())));
              },
            ),
            GestureDetector(
              child: _CardSingle(
                icon: Icons.movie_rounded,
                color: Color.fromARGB(255, 85, 135, 223),
                text: "Movies",
                secondText: "",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePageMovies())));
              },
              
            )
          ],
        ),
        TableRow(
          children: [
            GestureDetector(
              child: _CardSingle(
                icon: Icons.wb_sunny_sharp,
                color: Color.fromARGB(255, 228, 96, 140),
                text: "Weather",
                secondText: "",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => WeatherHomePage())));
              },
            ),
            GestureDetector(
              child: _CardSingle(
                icon: Icons.settings_applications_rounded,
                color: Colors.orangeAccent,
                text: "Settings",
                secondText: "",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SettingsPage())));
              },
            )
          ],
        ),
      ],
    );
  }
}

/**
 * creacion de cartas del menu principal, solo se le envian los parametros para la creacion de estas
 * 
 */
class _CardSingle extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String secondText;

  _CardSingle({Key key, this.icon, this.color, this.text, this.secondText})
      : super(key: key);

  /**
   * propiedad del decoration para el container
   */
  var boxDecoration = BoxDecoration(
    color: Color.fromRGBO(62, 66, 187, 0.5),
    borderRadius: BorderRadius.circular(25),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(15),
      decoration: boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              size: 45,
            ),
            radius: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${text}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold, 
            ),
          ),
          Text(
            "${secondText}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
