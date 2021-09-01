import 'package:flutter/material.dart';
import 'package:flutter_lista_peliculas/movies/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // myRequest();
    return MaterialApp(
      title: 'Lista de Peliculas',
      initialRoute: ListPage.ROUTE,
      routes: {ListPage.ROUTE: (_) => ListPage()},
    );
  }
}
