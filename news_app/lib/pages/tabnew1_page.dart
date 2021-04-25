import 'package:flutter/material.dart';
import 'package:news_app/services/new_service.dart';
import 'package:news_app/widget/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newservice = Provider.of<New_Service>(context);

    return Scaffold(
      body: Lista_Noticias(newservice.headers),
    );
  }
}
