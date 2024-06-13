import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:films/core/domain/models/film_model.dart';
import 'package:films/core/ui/widgets/star_rate.dart';

import '../../../gen/assets.gen.dart';
import '../resources/app_colors.dart';
import '../resources/app_text.dart';

class HorizontalContentContainer extends StatelessWidget {
  const HorizontalContentContainer(
      {super.key,
      required this.film,
      required this.navigateToFilm,
      required this.onSave});

  final FilmModel film;

  final Future<void> Function(String) navigateToFilm;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            navigateToFilm(film.id);
          },
          child: SizedBox(
            height: 266,
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      film.backdropUrl,
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
                  padding: const EdgeInsets.only(top: 12, bottom: 3),
                  child: Text(
                    film.title,
                    style: AppTextStyles(context).head2,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      film.voteAverage,
                      style: AppTextStyles(context)
                          .body1
                          .copyWith(fontSize: 22, height: 1),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    StarRating(
                      rating: double.parse(film.voteAverage),
                      width: 140,
                      size: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 16,
            right: 16,
            child: InkWell(
              onTap: onSave,
              child: SvgPicture.asset(
                film.isSaved ? Assets.icons.saved : Assets.icons.savedOutline,
                height: 24,
                width: 24,
              ),
            ))
      ],
    );
  }
}
