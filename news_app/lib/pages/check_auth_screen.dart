import 'package:flutter/material.dart';
import 'package:news_app/pages/pages.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widget/MainHome/main_home_page.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authservicetoken = Provider.of<AuthLoginFirebase>(context,
                                                            listen: false); //solo lo uso una vez, no necesito escuchar cambios

    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: authservicetoken.readTokenAuth(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) {
                return Text('espere..');
              }

              if (snapshot.data == '') { 
                  //revisar si teneemos un token  , sino a login
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => LoginPage(),
                        transitionDuration: const Duration(seconds: 0),
                      ));
                });

              }else{   
                // si ya existe un token vamos al homepage
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => MainSplashHome(),
                        transitionDuration: const Duration(seconds: 0),
                      ));
                });

              }

              return Container();//siempre debe retornar un widget por ser un futurebuilder 
            }),
      ),
    );
  }
}
