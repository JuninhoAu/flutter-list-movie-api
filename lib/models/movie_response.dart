import 'package:flutter_lista_peliculas/models/movie.dart';

class MovieResponse {
  List<Movie> results;
  int page;

  MovieResponse(this.results, this.page);

  MovieResponse.fromJSon(Map<String, dynamic> movieMapResponse)
      : this.page = movieMapResponse["page"],
        this.results = List<Movie>.from(
            movieMapResponse["results"].map((m) => Movie.fromJson(m)));
}
