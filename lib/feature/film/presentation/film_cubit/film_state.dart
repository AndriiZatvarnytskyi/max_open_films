part of 'film_cubit.dart';

@freezed
class FilmState with _$FilmState {
  const factory FilmState.loading() = FilmStateInitial;
  const factory FilmState.content({
    required FilmModel film,
  }) = FilmStateContent;
}
