import 'package:flutter/material.dart';
import 'package:flutter_lista_peliculas/models/movie.dart';

class DetailPage extends StatelessWidget {
  static const ROUTE = "/detail";

  @override
  Widget build(BuildContext context) {
    // final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("Detalles"),
        ),
        body: Text("jola"));
  }
}
