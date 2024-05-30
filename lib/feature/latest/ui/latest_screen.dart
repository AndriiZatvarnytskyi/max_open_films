import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:max_open_films/core/domain/models/film_model.dart';
import 'package:max_open_films/core/ui/widgets/vertical_content_container.dart';

import '../../../core/data/remote/api_services.dart';
import '../../../core/ui/widgets/custom_title.dart';
import '../../../gen/assets.gen.dart';
import '../../search/data/films_repository.dart';
import '../../search/presentation/profile_settings_cubit/list_film_cubit.dart';

class LatestScreen extends StatelessWidget {
  const LatestScreen(
      {super.key, required this.navigateBack, required this.navigateToFilm});

  final void Function(String) navigateToFilm;
  final VoidCallback navigateBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ListFilmCubit(
          repository: FilmsRepository(
            ApiService(),
          ),
        )..init(),
        child: BlocBuilder<ListFilmCubit, ListFilmState>(
          builder: (context, state) {
            if (state is ListFilmStateContent) {
              return _LatestScreenContent(
                state: state,
                navigateToFilm: navigateToFilm,
                navigateBack: navigateBack,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class _LatestScreenContent extends StatelessWidget {
  const _LatestScreenContent({
    required this.state,
    required this.navigateBack,
    required this.navigateToFilm,
  });

  final ListFilmStateContent state;
  final void Function(String) navigateToFilm;
  final VoidCallback navigateBack;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 73,
                bottom: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: navigateBack,
                    child: SvgPicture.asset(
                      Assets.icons.back,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  const CustomTitle(
                    title: 'Latest',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = (constraints.maxWidth / 175).floor();

                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 175 / 359,
                  ),
                  itemCount: state.latestFilms.length,
                  itemBuilder: (context, index) {
                    final FilmModel film = state.latestFilms[index];
                    return VerticalContentContainer(
                      onSave: () =>
                          context.read<ListFilmCubit>().saveLatest(film),
                      film: film,
                      navigateToFilm: navigateToFilm,
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
