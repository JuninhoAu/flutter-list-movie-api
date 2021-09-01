import 'package:flutter/material.dart';
import 'package:flutter_lista_peliculas/helpers/http_helper.dart';
import 'package:flutter_lista_peliculas/models/movie_response.dart';

class ListPage extends StatefulWidget {
  static const ROUTE = "/";

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List<Widget>? widgetMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hola Lista"),
        ),
        body: Container(
          child: FutureBuilder(
            future: _dataList(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: this.widgetMovie!.length,
                  itemBuilder: (_, int position) {
                    return this.widgetMovie![position];
                  });
            },
          ),
        ));
  }

  Future<List<Widget>> _dataList() async {
    final MovieResponse? movieResponse = await HttpHelper.getPopular();

    widgetMovie = movieResponse?.results.map((m) {
      var image;

      if (m.backdropPath == null) {
        image = NetworkImage(
            "https://64.media.tumblr.com/df9620199871b2a04df808add78e9b57/57db70582a7be650-60/s400x600/27df52479f02e2cc1158d6b3c89797ee65210f4e.jpg");
      } else {
        // image = Image.network(HttpHelper.urlIamge + m.posterPath);
        image = NetworkImage(HttpHelper.urlIamge + m.posterPath);
      }

      return Card(
        child: ListTile(
          //leading: image,
          leading: CircleAvatar(
            backgroundImage: image,
          ),
          title: Text(m.title),
        ),
      );
    }).toList();

    return widgetMovie!;
  }
}
