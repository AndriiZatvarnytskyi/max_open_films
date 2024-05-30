part of 'saved_film_cubit.dart';

@freezed
class SavedFilmState with _$SavedFilmState {
  const factory SavedFilmState.loading() = SavedFilmStateInitial;
  const factory SavedFilmState.content({
    required List<FilmEntity> films,
  }) = SavedFilmStateContent;
}
