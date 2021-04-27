import 'package:flutter/material.dart';
import 'package:news_app/models/new_models.dart';
import 'package:news_app/theme/tema.dart';

class Lista_Noticias extends StatelessWidget {
  const Lista_Noticias(this.noticias);

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int i) {
          return _Noticia(
            noticia: this.noticias[i],
            index: i,
          );
        });
  }
}

class _Noticia extends StatelessWidget {
  const _Noticia({this.noticia, this.index});

  final int index;
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Tabtopbar(
          noticia: noticia,
          index: index,
        ),
        _TarjeImagen(
          noticia: this.noticia,
          index: index,
        ),
        SizedBox(
          height: 5,
        ),
        _TarjetBody(noticia: this.noticia),
        SizedBox(
          height: 10,
        ),
        _Botones(
          noticia: this.noticia,
          index: index,
        ),
        Divider(
          color: mitemaGlobal.accentColor,
        ),
      ],
    );
  }
}

class _Tabtopbar extends StatelessWidget {
  const _Tabtopbar({this.noticia, this.index});

  final int index;
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}',
            style: TextStyle(color: mitemaGlobal.accentColor),
          ),
          SizedBox(width: 10,),
          Text('${noticia.source.name}'),
        ],
      ),
    );
  }
}

class _TarjeImagen extends StatelessWidget {
  const _TarjeImagen({this.noticia, this.index});

  final int index;
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/giphy.gif'),
                  fadeInDuration: Duration(seconds: 2),
                  image: NetworkImage(noticia.urlToImage),
                )
              : Image(image: AssetImage('assets/no-image.png'))),
    );
  }
}

class _TarjetBody extends StatelessWidget {
  final Article noticia;

  const _TarjetBody({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _Botones extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Botones({Key key, this.noticia, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              //print(noticia.description);
              //con el navigator.of lo puedo lanzar a otra ventana para ver mas informacion.
            },
            fillColor: mitemaGlobal.accentColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            child: Icon(Icons.more_outlined),
          ),
        ],
      ),
    );
  }
}
