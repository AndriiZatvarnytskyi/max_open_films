import 'package:flutter/material.dart';
import 'package:films/core/ui/resources/app_colors.dart';

import '../../../../gen/fonts.gen.dart';

class AppTextStyles {
  AppTextStyles(this.context);
  final BuildContext context;

  TextStyle get head1 => const TextStyle(
        color: AppColors.white,
        fontFamily: FontFamily.poppins,
        letterSpacing: 0,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  TextStyle get head2 => const TextStyle(
        color: AppColors.white,
        fontFamily: FontFamily.poppins,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  TextStyle get head3 => const TextStyle(
        color: AppColors.white,
        fontFamily: FontFamily.poppins,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  TextStyle get body1 => const TextStyle(
        color: AppColors.white,
        fontFamily: FontFamily.poppins,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get body2 => const TextStyle(
        color: AppColors.white,
        fontFamily: FontFamily.poppins,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get body3 => const TextStyle(
        color: AppColors.lightGrey,
        fontFamily: FontFamily.poppins,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      );
}
