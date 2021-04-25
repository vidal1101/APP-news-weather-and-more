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
        Divider(),
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
                  fadeInDuration: Duration(seconds: 3),
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
