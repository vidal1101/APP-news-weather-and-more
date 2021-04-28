import 'package:flutter/material.dart';
import 'package:news_app/models/new_models.dart';
import 'package:news_app/theme/tema.dart';

class DetallsNews extends StatelessWidget {
  final Article noticia;

  const DetallsNews({this.noticia});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          // mainAxisAlignment: MainAxisAlignment.start,
          slivers: <Widget>[
            _imageNews(noticia),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 15.0,
              ),
              _postertitle(noticia),
              _description(noticia),
              _content(noticia),
            ])),
          ],
        ),
      ),
    );
  }

 

  Widget _imageNews(Article noticia) {
    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 275.0,
      backgroundColor: mitemaGlobal.accentColor,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(noticia.source.name),
        background: FadeInImage(
          fadeInDuration: Duration(seconds: 3),
          placeholder: AssetImage('assets/giphy.gif'),
          image: NetworkImage(noticia.urlToImage),
          //fit: BoxFit.fill,
          //height: 195.0,
        ),
      ),
    );
  }

   Widget _postertitle(Article noticia) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.0),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Autor: '+noticia.author != null ? noticia.author : " Anonimo",
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 20.0),
              Text(
                'Publicado: ' + noticia.publishedAt.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _description(Article noticia) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Text(
        noticia.description,
        style: TextStyle(fontWeight: FontWeight.w800),
        textAlign: TextAlign.justify,
      ),
    );
  }

   Widget _content(Article noticia) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Text(
        noticia.content,
        style: TextStyle(fontWeight: FontWeight.w800),
        textAlign: TextAlign.justify,
      ),
    );
  }


}
