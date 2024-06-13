import 'package:films/core/domain/entity/film.dart';

import '../../../core/data/local/box_manager.dart';
import '../../../core/data/remote/api_services.dart';
import '../../../core/domain/models/film_model.dart';

class FilmsRepository {
  FilmsRepository(
    this._api,
  );
  final ApiService _api;

  Future<List<FilmModel>> getTopRate() async {
    List<FilmModel> films = await _api.getTopRate();
    await _updateSavedStatus(films);

    return films;
  }

  Future<List<FilmModel>> getLatest() async {
    List<FilmModel> films = await _api.getLatest();
    await _updateSavedStatus(films);

    return films;
  }

  Future<List<FilmModel>> searchFilms(String query) async {
    List<FilmModel> films = await _api.searchFilms(query);
    await _updateSavedStatus(films);

    return films;
  }

  Future<FilmModel> getFilm(String id) async {
    FilmModel film = await _api.getFilm(id);
    await _updateSavedStatusForFilm(film);
    return film;
  }

  Future<List<FilmEntity>> getSavedFilm() async {
    var filmsBox = await BoxManager.instance.openBox<FilmEntity>('films');
    List<FilmEntity> films = filmsBox.values.toList();
    return films;
  }

  Future<void> removeFilm(FilmEntity film) async {
    var filmsBox = await BoxManager.instance.openBox<FilmEntity>('films');
    await filmsBox.delete(film.id);
  }

  Future<void> saveFilm(FilmEntity film) async {
    var filmsBox = await BoxManager.instance.openBox<FilmEntity>('films');
    await filmsBox.put(film.id, film);
  }

  Future<void> _updateSavedStatus(List<FilmModel> films) async {
    var filmsBox = await BoxManager.instance.openBox<FilmEntity>('films');
    for (var film in films) {
      if (filmsBox.values.any((entity) => entity.id == film.id)) {
        film.isSaved = true;
      }
    }
  }

  Future<void> _updateSavedStatusForFilm(FilmModel film) async {
    var filmsBox = await BoxManager.instance.openBox<FilmEntity>('films');
    if (filmsBox.values.any((entity) => entity.id == film.id)) {
      film.isSaved = true;
    }
  }
}
