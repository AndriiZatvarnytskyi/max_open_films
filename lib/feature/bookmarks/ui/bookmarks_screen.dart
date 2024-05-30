import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_open_films/core/domain/models/film_model.dart';
import 'package:max_open_films/feature/bookmarks/presentation/saved_film_cubit/saved_film_cubit.dart';

import '../../../../core/ui/widgets/custom_title.dart';
import '../../../core/data/remote/api_services.dart';
import '../../../core/ui/widgets/content_container.dart';
import '../../search/data/films_repository.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key, required this.navigateToFilm});

  final Future<void> Function(String) navigateToFilm;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SavedFilmCubit(
            repository: FilmsRepository(
              ApiService(),
            ),
          )..init(),
          child: BlocBuilder<SavedFilmCubit, SavedFilmState>(
            builder: (context, state) {
              if (state is SavedFilmStateContent) {
                return _BookmarksScreenContent(
                  state: state,
                  navigateToFilm: navigateToFilm,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _BookmarksScreenContent extends StatelessWidget {
  const _BookmarksScreenContent({
    required this.state,
    required this.navigateToFilm,
  });

  final SavedFilmStateContent state;
  final Future<void> Function(String) navigateToFilm;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 73,
                  bottom: 20,
                ),
                child: CustomTitle(
                  title: 'Bookmarks',
                ),
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    final FilmModel film =
                        FilmModel.fromEntity(state.films[index]);
                    return ContentContainer(
                        onSave: () => context
                            .read<SavedFilmCubit>()
                            .unSave(state.films[index]),
                        navigateToFilm: (value) => navigateToFilm
                            .call(value)
                            .whenComplete(
                                () => context.read<SavedFilmCubit>().init()),
                        film: film);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: state.films.length)
            ],
          ),
        ),
      ),
    );
  }
}
