class Movie {
  String posterPath;
  String overview;
  String releaseDate;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  int voteCount;
  String backdropPath;
  // double popularity;

  Movie(
      this.posterPath,
      this.overview,
      this.releaseDate,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.voteCount,
      this.backdropPath);

  Movie.fromJson(Map<String, dynamic> movieMap)
      : this.posterPath = movieMap["poster_path"],
        this.overview = movieMap["overview"],
        this.releaseDate = movieMap["release_date"],
        this.id = movieMap["id"],
        this.originalTitle = movieMap["original_title"],
        this.originalLanguage = movieMap["original_language"],
        this.title = movieMap["title"],
        this.voteCount = movieMap["vote_count"],
        this.backdropPath = movieMap["backdrop_path"];
}
