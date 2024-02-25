import 'package:appnation_sc/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class NoResultFoundWidget extends StatelessWidget {
  const NoResultFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "No results found",
            style: AppTextStyle.blackMedium16,
          ),
          Text(
            "Try searching with another word",
            style: AppTextStyle.greyDarkMedium12,
          ),
        ],
      ),
    );
  }
}
