part of 'list_film_cubit.dart';

@freezed
class ListFilmState with _$ListFilmState {
  const factory ListFilmState.loading() = ListFilmStateInitial;
  const factory ListFilmState.content({
    @Default([]) List<FilmModel> topRateFilms,
    @Default([]) List<FilmModel> latestFilms,
    @Default([]) List<FilmModel> searchFilms,
    String? filmName,
  }) = ListFilmStateContent;
}
