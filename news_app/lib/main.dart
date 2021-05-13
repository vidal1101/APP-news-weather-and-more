import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/services/new_service.dart';
import 'package:news_app/theme/tema.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( 
      providers: [
        ChangeNotifierProvider(create: (_) => new New_Service() ),
      ],
          child: MaterialApp(
        theme: mitemaGlobal,
        debugShowCheckedModeBanner: false,
        //initialRoute: '/',
        home: Home_Page(),
      ),
    );
  }
}
