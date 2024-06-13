import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:films/core/domain/models/film_model.dart';
import 'package:films/core/ui/widgets/star_rate.dart';
import 'package:films/gen/assets.gen.dart';

import '../resources/app_colors.dart';
import '../resources/app_text.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    super.key,
    required this.navigateToFilm,
    required this.film,
    required this.onSave,
  });

  final FilmModel film;
  final void Function(String) navigateToFilm;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => navigateToFilm(film.id),
          child: SizedBox(
            height: 273,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 273,
                  width: 182,
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
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 230,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        film.title,
                        style: AppTextStyles(context).head2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        film.genres.join(', '),
                        style: AppTextStyles(context).body2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        film.overview,
                        style: AppTextStyles(context).body3,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 16,
            left: 150,
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
