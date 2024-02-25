import 'package:appnation_sc/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 32,
      endIndent: 32,
      color: AppColor.greyLight,
    );
  }
}
