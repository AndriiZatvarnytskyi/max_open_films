import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:films/core/domain/models/film_model.dart';

import '../../../core/data/remote/api_services.dart';
import '../../../core/ui/resources/app_text.dart';
import '../../../core/ui/widgets/content_container.dart';
import '../../../core/ui/widgets/custom_title.dart';
import '../data/films_repository.dart';
import '../presentation/profile_settings_cubit/list_film_cubit.dart';
import 'widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.navigateToFilm});

  final Future<void> Function(String) navigateToFilm;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListFilmCubit(
        repository: FilmsRepository(
          ApiService(),
        ),
      )..init(),
      child: Scaffold(
          body: SingleChildScrollView(
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
                  title: 'Search',
                ),
              ),
              BlocBuilder<ListFilmCubit, ListFilmState>(
                  builder: (context, state) {
                return CustomSearchTextField(
                    onChanged: context.read<ListFilmCubit>().search);
              }),
              BlocBuilder<ListFilmCubit, ListFilmState>(
                builder: (context, state) {
                  if (state is ListFilmStateContent) {
                    return _SearchScreenContent(
                      state: state,
                      navigateToFilm: navigateToFilm,
                    );
                  } else {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.3),
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class _SearchScreenContent extends StatelessWidget {
  const _SearchScreenContent(
      {required this.state, required this.navigateToFilm});

  final ListFilmStateContent state;
  final Future<void> Function(String) navigateToFilm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Text('Search results (${state.searchFilms.length})',
              style: AppTextStyles(context).head3),
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20),
            itemBuilder: (context, index) {
              final FilmModel film = state.searchFilms[index];
              return ContentContainer(
                film: film,
                onSave: () => context.read<ListFilmCubit>().saveSearh(film),
                navigateToFilm: (value) =>
                    navigateToFilm.call(value).whenComplete(
                          () => context
                              .read<ListFilmCubit>()
                              .search(state.filmName ?? ''),
                        ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: state.searchFilms.length)
      ],
    );
  }
}
