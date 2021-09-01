import 'package:flutter/material.dart';
import 'package:flutter_lista_peliculas/helpers/http_helper.dart';
import 'package:flutter_lista_peliculas/models/movie_response.dart';

class ListPage extends StatefulWidget {
  static const ROUTE = "/";

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  MovieResponse? movieResponse;

  @override
  void initState() {
    _dataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hola Lista"),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: this.movieResponse?.results == null
                    ? 0
                    : this.movieResponse!.results.length,
                itemBuilder: (_, int position) {
                  var image;
                  var m = movieResponse!.results[position];

                  if (this.movieResponse?.results[position].backdropPath ==
                      null) {
                    image = NetworkImage(
                        "https://64.media.tumblr.com/df9620199871b2a04df808add78e9b57/57db70582a7be650-60/s400x600/27df52479f02e2cc1158d6b3c89797ee65210f4e.jpg");
                  } else {
                    image = NetworkImage(HttpHelper.urlIamge + m.posterPath);
                  }

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: image),
                      title: Text(m.title),
                      subtitle: Align(
                          alignment: Alignment.centerRight,
                          child: Text(m.releaseDate,
                              style: TextStyle(fontStyle: FontStyle.italic))),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {},
                    ),
                  );
                })));
  }

  _dataList() async {
    movieResponse = await HttpHelper.getPopular();
    setState(() {});
  }
}
