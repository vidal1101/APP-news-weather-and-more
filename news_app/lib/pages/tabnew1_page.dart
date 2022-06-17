import 'package:flutter/material.dart';
import 'package:news_app/services/new_service.dart';
import 'package:news_app/services/services_weather.dart';
import 'package:news_app/widget/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

/**
   * AutomaticKeepAliveClientMixin: conserva la posicion de ese widget en pantalla 
   * para no redibujarlo. 
   */
class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newservice = Provider.of<New_Service>(context);
    final newwaether = Provider.of<ServiceWeather>(context).getweather();

    return Scaffold(
      body: (newservice.headers.length == 0) //si no hay data se carga el loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.purple,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('LOADING NEWS ...'),
                ],
              ),
            )
          : Lista_Noticias(newservice.headers), // existe la data, carga las noticias
    );
  }

  @override
  // TODO: implement wantKeepAlive
  // conserva donde se queda el widget y no lo destruye al pasar a otra ventana
  bool get wantKeepAlive => true;
}
