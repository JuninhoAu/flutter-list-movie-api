import 'dart:convert';
import 'dart:io';

import 'package:flutter_lista_peliculas/models/movie_response.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static final String key = '?api_key=9ef350e7424c4a32118de29377a9ea87';
  static final String url = 'https://api.themoviedb.org/3/movie/';
  static final String urlIamge = 'https://image.tmdb.org/t/p/w500';

  static Future<MovieResponse?> getPopular() async {
    final res = await http.get(Uri.parse(url + "popular" + key));

    if (res.statusCode == HttpStatus.ok) {
      final jsonMap = jsonDecode(res.body);
      final MovieResponse movieResponse = new MovieResponse.fromJSon(jsonMap);
      return movieResponse;
    } else {
      return null;
    }
  }
}
