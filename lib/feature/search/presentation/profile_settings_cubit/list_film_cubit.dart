import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entity/film.dart';
import '../../../../core/domain/models/film_model.dart';
import '../../data/films_repository.dart';

part 'list_film_cubit.freezed.dart';
part 'list_film_state.dart';

class ListFilmCubit extends Cubit<ListFilmState> {
  ListFilmCubit({required this.repository})
      : super(const ListFilmState.loading());

  final FilmsRepository repository;

  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData() async {
    emit(const ListFilmState.loading());
    final List<FilmModel> latestFilms = await repository.getLatest();
    await repository.getTopRate().then((films) async {
      emit(
          ListFilmState.content(topRateFilms: films, latestFilms: latestFilms));
    }).catchError((_) async {
      emit(const ListFilmState.loading());
    });
  }

  Future<void> search(String value) async {
    if (state is ListFilmStateContent) {
      final currentState = state as ListFilmStateContent;
      if (value.length > 2) {
        try {
          final List<FilmModel> searchFilms =
              await repository.searchFilms(value);
          emit(
              currentState.copyWith(searchFilms: searchFilms, filmName: value));
        } catch (e) {
          // ignore: avoid_print
          print(e);
        }
      } else {
        emit(currentState.copyWith(filmName: value));
      }
    }
  }

  Future<void> saveSearh(FilmModel film) async {
    final ListFilmState state = this.state;

    if (state is ListFilmStateContent) {
      List<FilmModel> films = [];
      films.addAll(state.searchFilms);
      int index = films.indexOf(film);
      bool isSaved = film.isSaved;
      if (!isSaved) {
        await repository.saveFilm(FilmEntity.fromModel(film));

        films[index] = film.copyWith(isSaved: true);
        emit(state.copyWith(searchFilms: films));
      } else {
        await repository.removeFilm(FilmEntity.fromModel(film));
        films[index] = film.copyWith(isSaved: false);
        emit(state.copyWith(searchFilms: films));
      }
    }
  }

  Future<void> saveLatest(FilmModel film) async {
    final ListFilmState state = this.state;

    if (state is ListFilmStateContent) {
      List<FilmModel> films = [];
      films.addAll(state.latestFilms);
      int index = films.indexOf(film);
      bool isSaved = film.isSaved;
      if (!isSaved) {
        await repository.saveFilm(FilmEntity.fromModel(film));
        films[index] = film.copyWith(isSaved: true);
        emit(state.copyWith(latestFilms: films));
      } else {
        await repository.removeFilm(FilmEntity.fromModel(film));
        films[index] = film.copyWith(isSaved: false);
        emit(state.copyWith(latestFilms: films));
      }
    }
  }

  Future<void> saveTopRate(FilmModel film) async {
    final ListFilmState state = this.state;

    if (state is ListFilmStateContent) {
      List<FilmModel> films = [];
      films.addAll(state.topRateFilms);
      int index = films.indexOf(film);
      bool isSaved = film.isSaved;
      if (!isSaved) {
        await repository.saveFilm(FilmEntity.fromModel(film));

        films[index] = film.copyWith(isSaved: true);
        emit(state.copyWith(topRateFilms: films));
      } else {
        await repository.removeFilm(FilmEntity.fromModel(film));
        films[index] = film.copyWith(isSaved: false);
        emit(state.copyWith(topRateFilms: films));
      }
    }
  }
}
