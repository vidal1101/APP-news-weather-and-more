import 'package:flutter/material.dart';

class DataSearh extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // las acciones de nuestro appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
   // icono a la parte izquierda del appbar
   return IconButton(
     icon: AnimatedIcon(
       icon: AnimatedIcons.menu_arrow , 
       progress: transitionAnimation ),
       onPressed: (){
         close(context, null);
       },
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // son las sugerencias que aparecen cuando la persona escribe ..
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar
    return Container();
  }
}
