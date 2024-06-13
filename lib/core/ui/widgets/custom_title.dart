import 'package:flutter/material.dart';
import 'package:films/core/ui/resources/app_colors.dart';

import '../resources/app_text.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTextStyles(context).head1,
          ),
          TextSpan(
            text: '.',
            style: AppTextStyles(context).head1.copyWith(
                  color: AppColors.yellow,
                ),
          ),
        ],
      ),
    );
  }
}
