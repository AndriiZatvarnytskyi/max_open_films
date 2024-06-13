import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:films/gen/assets.gen.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    required this.rating,
    required this.size,
    required this.width,
  });

  final double rating;
  final double size;
  final double width;

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars) >= 0.5 ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStars;

    List<Widget> stars = [];

    for (int i = 0; i < fullStars; i++) {
      stars.add(SvgPicture.asset(
        Assets.icons.starFull,
        width: size,
        height: size,
      ));
    }

    for (int i = 0; i < halfStars; i++) {
      stars.add(SvgPicture.asset(
        Assets.icons.star50,
        width: size,
        height: size,
      ));
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(SvgPicture.asset(
        Assets.icons.starEmpty,
        width: size,
        height: size,
      ));
    }

    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: stars,
      ),
    );
  }
}
