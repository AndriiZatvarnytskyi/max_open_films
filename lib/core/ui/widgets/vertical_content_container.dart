import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:films/core/domain/models/film_model.dart';
import 'package:films/gen/assets.gen.dart';

import '../resources/app_colors.dart';
import '../resources/app_text.dart';
import 'star_rate.dart';

class VerticalContentContainer extends StatelessWidget {
  const VerticalContentContainer(
      {super.key,
      required this.film,
      required this.navigateToFilm,
      required this.onSave});

  final FilmModel film;
  final void Function(String) navigateToFilm;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Stack(
        children: [
          InkWell(
            onTap: () => navigateToFilm(film.id),
            child: SizedBox(
              height: 359,
              width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 272,
                    width: 170,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        film.posterUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, error, stackTrace) {
                          return const Center(
                              child: Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.grey,
                            size: 70,
                          ));
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.yellow,
                              value: loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                    ),
                    child: SizedBox(
                      width: 170,
                      child: Text(
                        film.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles(context).head3,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        film.voteAverage,
                        style:
                            AppTextStyles(context).body1.copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      MediaQuery.sizeOf(context).width - 280 > 100
                          ? StarRating(
                              rating: double.parse(film.voteAverage),
                              width: 100,
                              size: 16,
                            )
                          : SvgPicture.asset(
                              Assets.icons.starFull,
                              height: 19,
                              width: 19,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 16,
              left: 138,
              child: InkWell(
                onTap: onSave,
                child: SvgPicture.asset(
                  film.isSaved ? Assets.icons.saved : Assets.icons.savedOutline,
                  height: 24,
                  width: 24,
                ),
              ))
        ],
      ),
    );
  }
}
