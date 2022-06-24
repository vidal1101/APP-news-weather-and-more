import 'package:flutter/material.dart';
import 'package:news_app/widget/cities_weather/cities_page.dart';
import 'package:news_app/widget/drawer_lateral.dart';

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white ),
        ),
      ),
      body: bodyWeather(),
      drawer: Drawer_Page(),
    );
  }

  Widget bodyWeather() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/welcome-1.jpg',
          ),
        ),
        SafeArea(
          child: Center(
            child: Container(
              //color:  Colors.amber,
              constraints: BoxConstraints(
                maxWidth: 250.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                  
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                      splashColor: Colors.white,
                      color: Colors.black,
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text('Add city'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> Cities() ));
                      }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
