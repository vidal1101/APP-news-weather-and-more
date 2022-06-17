import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/widget/MainHome/main_home_page.dart';

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
      splash: 'assets/icon/app-information.png',
      nextScreen: MainSplashHome(), //mainHiome
      duration: 2000,
      centered: true,
      curve: Curves.easeInCirc,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
