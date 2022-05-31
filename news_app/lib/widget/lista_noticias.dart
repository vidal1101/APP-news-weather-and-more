
import 'package:flutter/material.dart';
import 'package:news_app/models/new_models.dart';
import 'package:news_app/pages/detalls_page.dart';
import 'package:news_app/theme/tema.dart';
import 'package:sentry/sentry.dart';

class Lista_Noticias extends StatefulWidget {
  
  const Lista_Noticias(this.noticias);

  final List<Article> noticias;

  @override
  _Lista_NoticiasState createState() => _Lista_NoticiasState();
}

// tamaño estimado de cada noticia
const itemSize = 390;

class _Lista_NoticiasState extends State<Lista_Noticias> {
  //controler para el customscrool
  final scrollController = ScrollController();

  void onlistener() {
    setState(() {});
  }

  @override
  void initState() {
    this.scrollController.addListener(onlistener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onlistener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: this.scrollController,
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            /**
               * variables para determinar las propieades del transform
               * posiciones , direncia,
               * hasta que el percent fuera de 0.0 a 0.9 por cada noticia, para aplicar tranforms matriz
               * la opacity para oscurecer el fefecto cuando sube. 
               * 
               */
            final posicionOffset = index * itemSize;
            final diference = scrollController.offset - posicionOffset;
            final percent = 1 - (diference / itemSize);
            double opacity = percent;
            double scale = percent;
            if (opacity > 1.0) opacity = 1.0;
            if (opacity < 0.0) opacity = 0.0;
            if (percent > 1.0) scale = 1.0;

            if (index == 0) print(percent);

            return Opacity(
              opacity: opacity,
              child: Transform(
                /*
                aplicando transform para futuros ejemplos.
                */
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(scale, 1.0),
                child: _Noticia(
                  noticia: this.widget.noticias[index],
                  index: index,
                ),
              ),
            );
          },
          childCount: this.widget.noticias.length,
        ))
      ],
    );

/*
        otra opcion de hacerlo con el listvien
    return ListView.builder(
        itemCount: widget.noticias.length,
        itemBuilder: (BuildContext context, int i) {
          return _Noticia(
            noticia: this.widget.noticias[i],
            index: i,
          );
        });
*/
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
        Transform.scale(
          scale: 0.9,
          child: _TarjeImagen(
            noticia: this.noticia,
            index: index,
          ),
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
          SizedBox(
            width: 10,
          ),
          Text('${noticia.source.name}'),
        ],
      ),
    );
  }
}

/**
 * carga la imagen de la noticia  a traves de clases reutilizables. 
 */
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
    final transaction = Sentry.startTransaction('processOrderBatch()', 'task');
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              print(noticia.description);

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
            onPressed: () {

              try {
                 Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetallsNews(
                          noticia: noticia,
                        )),
              );


              } catch (exception) {
                transaction.throwable = exception;
                transaction.status = SpanStatus.internalError();
              } 

              
            },
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
