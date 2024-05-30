import 'dart:convert';

import 'package:max_open_films/core/domain/entity/film.dart';

FilmModel filmModelFromJson(String str) => FilmModel.fromJson(json.decode(str));

List<FilmModel> filmModelListFromJson(String str) {
  final jsonData = json.decode(str);
  return List<FilmModel>.from(
      jsonData['results'].map((item) => FilmModel.fromJson(item)));
}

class FilmModel {
  FilmModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.posterUrl,
    required this.backdropUrl,
    required this.genres,
    this.isSaved = false,
  });

  String id;
  String title;
  String overview;
  String voteAverage;
  String posterUrl;
  String backdropUrl;
  List<String> genres;
  bool isSaved;

  static double scaleToFive(double value) {
    double scaledValue = value / 2;
    return (scaledValue * 2).round() / 2.0;
  }

  static List<String> _getGenreNamesFromIds(List<int> genreIds) {
    return genreIds.map((id) => genreMap[id] ?? 'Unknown').toList();
  }

  static List<String> _getGenreNamesFromObjects(List<dynamic> genres) {
    return genres.map((genre) => genre['name'].toString()).toList();
  }

  factory FilmModel.fromEntity(FilmEntity entity) {
    return FilmModel(
        id: entity.id,
        title: entity.title,
        overview: entity.overview,
        voteAverage: entity.voteAverage,
        posterUrl: entity.posterUrl,
        backdropUrl: entity.backdropUrl,
        genres: entity.genres,
        isSaved: entity.isSaved);
  }

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    List<String> genres;
    if (json['genre_ids'] != null) {
      List<int> genreIds = List<int>.from(json['genre_ids']);
      genres = _getGenreNamesFromIds(genreIds);
    } else if (json['genres'] != null) {
      genres = _getGenreNamesFromObjects(json['genres']);
    } else {
      genres = [];
    }

    return FilmModel(
      id: json["id"].toString(),
      title: json["title"] ?? json["original_title"],
      overview: json["overview"],
      voteAverage:
          scaleToFive((json["vote_average"] as num).toDouble()).toString(),
      posterUrl: 'https://image.tmdb.org/t/p/w500${json["poster_path"]}',
      backdropUrl: 'https://image.tmdb.org/t/p/w500${json["backdrop_path"]}',
      genres: genres,
      isSaved: false,
    );
  }

  FilmModel copyWith({
    String? id,
    String? title,
    String? overview,
    String? voteAverage,
    String? posterUrl,
    String? backdropUrl,
    List<String>? genres,
    bool? isSaved,
  }) {
    return FilmModel(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      voteAverage: voteAverage ?? this.voteAverage,
      posterUrl: posterUrl ?? this.posterUrl,
      backdropUrl: backdropUrl ?? this.backdropUrl,
      genres: genres ?? this.genres,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  static final Map<int, String> genreMap = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
  };
}
