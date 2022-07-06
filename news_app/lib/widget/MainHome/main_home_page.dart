import 'package:flutter/material.dart';
import 'package:news_app/services/services.dart';
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
      body: Container(
        child: Stack(
          children: [
            BackGroudHome(),
           // LogoutApp(),
// color y fonrmas de fondo
            _HomeBody(), // el cuerpo y opciones de la app
          ],
        ),
      ),
    );
  }

  
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const sizeHeight = SizedBox(
      height: 50,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          //dar un espacio en la parte superior
          sizeHeight,
          //los titulos del home
          PageTitle(), // totulo del home
          sizeHeight,
          CardHomeTable(), //opcones del body
          sizeHeight,
          LogoutApp(),
          
          sizeHeight,

        ],
      ),
    );
  }
}


class LogoutApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
            color: Colors.blueAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent,
                offset: Offset(10, 10),
                blurRadius: 40,
              )
            ],
          ),
          //color: Colors.amber,
          child: IconButton(
            onPressed: (){
               print('en el evento ');
                UserSecureStorage.logout('token');
                Navigator.pushReplacementNamed(context, 'login');
            },
             icon:  Icon(Icons.login_rounded) ),
           
    );
  }
}
