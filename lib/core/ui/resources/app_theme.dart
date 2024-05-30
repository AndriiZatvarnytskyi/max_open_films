import 'package:flutter/material.dart';

import '../../../../gen/fonts.gen.dart';
import 'app_colors.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light(BuildContext context) {
    return ThemeData(
      fontFamily: FontFamily.poppins,
      splashFactory: InkRipple.splashFactory,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      colorScheme: const ColorScheme.light(
        primary: AppColors.yellow,
        onPrimary: AppColors.white,
        background: AppColors.dark,
        onBackground: AppColors.white,
      ),
    );
  }
}
