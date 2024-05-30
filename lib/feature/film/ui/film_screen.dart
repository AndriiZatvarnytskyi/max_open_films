import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:max_open_films/core/ui/resources/app_colors.dart';
import 'package:max_open_films/feature/film/presentation/film_cubit/film_cubit.dart';

import '../../../core/data/remote/api_services.dart';
import '../../../core/ui/resources/app_text.dart';
import '../../../core/ui/widgets/star_rate.dart';
import '../../../gen/assets.gen.dart';
import '../../search/data/films_repository.dart';

class FilmScreen extends StatelessWidget {
  const FilmScreen({
    super.key,
    required this.navigationBack,
    required this.id,
  });

  final VoidCallback navigationBack;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmCubit(
        repository: FilmsRepository(
          ApiService(),
        ),
      )..init(id),
      child: Scaffold(
        body: BlocBuilder<FilmCubit, FilmState>(
          builder: (context, state) {
            if (state is FilmStateContent) {
              return _ProfileScreenContent(
                navigationBack: navigationBack,
                state: state,
                id: id,
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

class _ProfileScreenContent extends StatelessWidget {
  const _ProfileScreenContent(
      {required this.state, required this.id, required this.navigationBack});

  final FilmStateContent state;
  final VoidCallback navigationBack;

  final String id;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 255, 255, 255),
                    const Color.fromARGB(255, 255, 255, 255),
                    const Color.fromARGB(255, 255, 255, 255),
                    const Color.fromARGB(34, 0, 0, 0).withOpacity(0.3),
                    const Color.fromARGB(34, 0, 0, 0).withOpacity(0)
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image.network(
                alignment: Alignment.topCenter,
                state.film.posterUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16)
                .copyWith(top: MediaQuery.sizeOf(context).height * 0.45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.film.title,
                  style: AppTextStyles(context).head1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      state.film.voteAverage,
                      style: AppTextStyles(context)
                          .body1
                          .copyWith(fontSize: 22, height: 1),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    StarRating(
                      rating: double.parse(state.film.voteAverage),
                      width: 100,
                      size: 16,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.film.genres.join(', '),
                  style: AppTextStyles(context).body2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.film.overview,
                  style: AppTextStyles(context).body3.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          Positioned(
            top: 83,
            left: 16,
            child: InkWell(
              onTap: navigationBack,
              child: SvgPicture.asset(
                Assets.icons.back,
                // ignore: deprecated_member_use
                color: AppColors.white,
                height: 24,
                width: 24,
              ),
            ),
          ),
          Positioned(
            top: 83,
            right: 30,
            child: InkWell(
              onTap: context.read<FilmCubit>().saveFilm,
              child: state.film.isSaved
                  ? SvgPicture.asset(
                      Assets.icons.saved,
                      height: 24,
                      width: 24,
                    )
                  : SvgPicture.asset(
                      Assets.icons.savedOutline,
                      height: 24,
                      width: 24,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
