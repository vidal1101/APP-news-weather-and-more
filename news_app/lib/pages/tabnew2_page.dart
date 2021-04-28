import 'package:flutter/material.dart';
import 'package:news_app/models/category_modal.dart';
import 'package:news_app/services/new_service.dart';
import 'package:news_app/theme/tema.dart';
import 'package:news_app/widget/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newSercicesCategoria =
        Provider.of<New_Service>(context).getnewCategoriaSeleccionada;

    

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            _ListaCategorias(),
            Expanded(child: Lista_Noticias(newSercicesCategoria)),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  // mantiene  el estado y la pósicion de los widget sin redibujar
  bool get wantKeepAlive => true;
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<New_Service>(context).categories;

    return Container(
      width: double.infinity,
      height: 110,
      //color: Colors.red,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categorias.length,
          itemBuilder: (BuildContext context, int index) {
            /**conentir a mayuscuslas */
            final cName = categorias[index].name;

            return Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    _CategoriaButton(categorias: categorias[index]),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
                  ],
                ));
          }),
    );
  }
}

/**
 * la creacion del botton para los iconos de las categorias
 */
class _CategoriaButton extends StatelessWidget {
  final Category categorias;

  const _CategoriaButton({this.categorias});

  @override
  Widget build(BuildContext context) {
    final newservice = Provider.of<New_Service>(context);

    Color coloricon = Colors.red;
    return GestureDetector(
      onTap: () {
        newservice.selectedCategoria = categorias.name;
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            categorias.icon,
            color: (newservice.getselectedCategoria == this.categorias.name)
                ? coloricon
                : mitemaGlobal.accentColor,
          )),
    );
  }
}
