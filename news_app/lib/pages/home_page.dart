import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/pages/tabnew1_page.dart';
import 'package:news_app/pages/tabnew2_page.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModal(),
      child: SafeArea(
        child: Scaffold(
          /*appBar: AppBar(
            title: Text('News '),
          ),
          */
          body: _paginas(),
          bottomNavigationBar: _navegacion(),
        ),
      ),
    );
  }
}

class _paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegar = Provider.of<_NavegacionModal>(context);

    return PageView(
      controller: navegar.pageControler,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page(),
        //Container(color: Colors.purpleAccent),
        //
      ],
    );
  }
}

class _navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtengo la instancia de la clase singleton.
    final navegar = Provider.of<_NavegacionModal>(context);

    return BottomNavigationBar(
        currentIndex: navegar.paginaActual,
        onTap: (i) {
          print("$i");
          navegar.paginaActual = i;
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('Para ti')),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), title: Text('Encabezados')),
        ]);
  }
}

/**
 * clase con patron mediador singleton. 
 */
class _NavegacionModal with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  PageController get pageControler => this._pageController;

  /**
   * setter para cambiar la pagina actual.
   */
  set paginaActual(int valor) {
    this._paginaActual = valor;
    /**se navega por l paginas porque el getter se establece en el pageview en el controller */
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }
}
