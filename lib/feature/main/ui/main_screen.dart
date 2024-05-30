import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_open_films/core/domain/models/film_model.dart';
import 'package:max_open_films/core/ui/widgets/content_container.dart';
import 'package:max_open_films/core/ui/widgets/custom_title.dart';
import 'package:max_open_films/core/ui/widgets/horizontal_content_container.dart';
import 'package:max_open_films/feature/search/presentation/profile_settings_cubit/list_film_cubit.dart';

import '../../../core/data/remote/api_services.dart';
import '../../../core/ui/resources/app_colors.dart';
import '../../../core/ui/resources/app_text.dart';
import '../../search/data/films_repository.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.navigateToChat,
    required this.navigateToFilm,
  });

  final VoidCallback navigateToChat;
  final Future<void> Function(String) navigateToFilm;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListFilmCubit(
        repository: FilmsRepository(
          ApiService(),
        ),
      )..init(),
      child: BlocBuilder<ListFilmCubit, ListFilmState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.map(
              loading: (state) => const Center(
                child: CircularProgressIndicator(),
              ),
              content: (state) => _MainStateContent(
                navigateToFilm: navigateToFilm,
                navigateToChat: navigateToChat,
                state: state,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MainStateContent extends StatelessWidget {
  const _MainStateContent({
    required this.state,
    required this.navigateToChat,
    required this.navigateToFilm,
  });

  final ListFilmStateContent state;
  final Future<void> Function(String) navigateToFilm;
  final VoidCallback navigateToChat;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 73,
                left: 16,
                bottom: 20,
              ),
              child: CustomTitle(
                title: 'Top Five',
              ),
            ),
            SizedBox(
              height: 266,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final FilmModel film = state.topRateFilms[index];
                    return HorizontalContentContainer(
                      onSave: () =>
                          context.read<ListFilmCubit>().saveTopRate(film),
                      navigateToFilm: (value) => navigateToFilm
                          .call(value)
                          .whenComplete(
                              () => context.read<ListFilmCubit>().init()),
                      film: film,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  itemCount: state.topRateFilms.length),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30)
                  .copyWith(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTitle(
                    title: 'Latest',
                  ),
                  InkWell(
                    onTap: navigateToChat,
                    child: Text(
                      'SEE MORE',
                      style: AppTextStyles(context).body1.copyWith(
                            color: AppColors.yellow,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                itemBuilder: (context, index) {
                  final FilmModel film = state.latestFilms[index];
                  return ContentContainer(
                    onSave: () =>
                        context.read<ListFilmCubit>().saveLatest(film),
                    film: film,
                    navigateToFilm: (value) => navigateToFilm
                        .call(value)
                        .whenComplete(
                            () => context.read<ListFilmCubit>().init()),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: 6)
          ],
        ),
      ),
    );
  }
}
