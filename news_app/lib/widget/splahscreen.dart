import 'package:flutter/material.dart';
import 'package:news_app/widget/MainHome/background_home.dart';
import 'package:news_app/widget/MainHome/main_home_page.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart'; //https://lottiefiles.com/
/**
 * splahscreen de la app
 */
class Splah extends StatefulWidget {

  @override
  State<Splah> createState() => _SplahState();
}

class _SplahState extends State<Splah> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: _bodySplash(),
      //backgroundColor: Colors.red,
      splashIconSize: double.infinity,
      nextScreen: MainSplashHome(), //mainHiome
      duration: 3500,
      //centered: true,
      curve: Curves.easeInExpo,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight, 
      animationDuration: Duration(microseconds: 1700), 
      );
  }

  Widget _bodySplash(){
    final mediaquey = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [

        BackGroudHome(), // color y fonrmas de fondo

        Column(
        children: [
        SizedBox(height: mediaquey.height * 0.30,),
        Lottie.asset('assets/splash/splashloading2.json' ,
        height: 200 , width: 200),
        SizedBox(height: 10,),
        Center(
          child: Text('News,Movies and Weather',
          style: TextStyle(fontSize: 15 , fontWeight:  FontWeight.bold, color:  Colors.white) ,),
          ),
        ],
      ),

      Positioned( 
        top: mediaquey.height * 0.95,
        child: Center(
          child: Text('By Rodrigo Vidal' , 
          style: TextStyle(color:  Colors.purpleAccent, fontSize: 20,   ) ),
        )),
      ],
    );
  }

}
