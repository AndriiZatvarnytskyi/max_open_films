import 'package:hive/hive.dart';
import 'package:max_open_films/core/domain/models/film_model.dart';

part 'film.g.dart';

@HiveType(typeId: 0)
class FilmEntity extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String overview;

  @HiveField(3)
  late String voteAverage;

  @HiveField(4)
  late String posterUrl;

  @HiveField(5)
  late String backdropUrl;

  @HiveField(6)
  late List<String> genres;

  @HiveField(7)
  late bool isSaved;

  FilmEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.posterUrl,
    required this.backdropUrl,
    required this.genres,
    this.isSaved = true,
  });

  factory FilmEntity.fromModel(FilmModel film) {
    return FilmEntity(
        id: film.id,
        title: film.title,
        overview: film.overview,
        voteAverage: film.voteAverage,
        posterUrl: film.posterUrl,
        backdropUrl: film.backdropUrl,
        genres: film.genres,
        isSaved: true);
  }
}
