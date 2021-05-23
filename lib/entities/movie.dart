import 'dart:convert';

class Movie {
  int id;
  String title;
  String posterPath;
  String releaseDate;
  String overview;
  String backdropPath;
  double rating;

  Movie({
    this.id,
    this.title,
    this.posterPath,
    this.releaseDate,
    this.overview,
    this.backdropPath,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        backdropPath = json["backdrop_path"],
        posterPath = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();

}
