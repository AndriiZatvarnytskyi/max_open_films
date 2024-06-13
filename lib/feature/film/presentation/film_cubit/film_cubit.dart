import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:films/core/domain/entity/film.dart';

import '../../../../core/domain/models/film_model.dart';
import '../../../search/data/films_repository.dart';

part 'film_cubit.freezed.dart';
part 'film_state.dart';

class FilmCubit extends Cubit<FilmState> {
  FilmCubit({required this.repository}) : super(const FilmState.loading());

  final FilmsRepository repository;

  Future<void> init(String id) async {
    await loadData(id);
  }

  Future<void> loadData(String id) async {
    emit(const FilmState.loading());
    await repository.getFilm(id).then((film) async {
      emit(FilmState.content(film: film));
    }).catchError((_) async {
      emit(const FilmState.loading());
    });
  }

  Future<void> saveFilm() async {
    final FilmState state = this.state;

    if (state is FilmStateContent) {
      bool isSaved = state.film.isSaved;
      if (!isSaved) {
        await repository.saveFilm(FilmEntity.fromModel(state.film));
        emit(
          state.copyWith(film: state.film.copyWith(isSaved: true)),
        );
      } else {
        await repository.removeFilm(FilmEntity.fromModel(state.film));
        emit(
          state.copyWith(film: state.film.copyWith(isSaved: false)),
        );
      }
    }
  }
}
