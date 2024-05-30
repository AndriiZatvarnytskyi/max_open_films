import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:max_open_films/core/ui/resources/app_colors.dart';
import 'package:max_open_films/gen/assets.gen.dart';

import '../../../../core/ui/resources/app_text.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.onChanged});

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: TextFormField(
        style: AppTextStyles(context).head3,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .copyWith(bottom: 4),
            child: SvgPicture.asset(
              Assets.icons.searchOutline,
              height: 20,
              width: 20,
            ),
          ),
          prefixIconConstraints: BoxConstraints.loose(const Size(52, 52)),
          hintText: 'Search',
          hintStyle: AppTextStyles(context)
              .head3
              .copyWith(color: AppColors.white.withOpacity(0.2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.darkGrey,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
