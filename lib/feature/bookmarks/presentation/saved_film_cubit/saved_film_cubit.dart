import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:films/core/domain/entity/film.dart';

import '../../../search/data/films_repository.dart';

part 'saved_film_cubit.freezed.dart';
part 'saved_film_state.dart';

class SavedFilmCubit extends Cubit<SavedFilmState> {
  SavedFilmCubit({required this.repository})
      : super(const SavedFilmState.loading());

  final FilmsRepository repository;

  Future<void> init() async {
    await loadData();
  }

  Future<void> loadData() async {
    emit(const SavedFilmState.loading());
    await repository.getSavedFilm().then((films) async {
      emit(SavedFilmState.content(films: films));
    }).catchError((_) async {
      emit(const SavedFilmState.loading());
    });
  }

  Future<void> unSave(FilmEntity film) async {
    final SavedFilmState state = this.state;

    if (state is SavedFilmStateContent) {
      List<FilmEntity> films = [];
      films.addAll(state.films);

      await repository.removeFilm(film);
      films.remove(film);
      emit(state.copyWith(films: films));
    }
  }
}
