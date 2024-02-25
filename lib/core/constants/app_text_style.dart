import 'package:appnation_sc/core/constants/app_color.dart';
import 'package:appnation_sc/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle createTextStyle(double fontSize, String fontFamily, Color color) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
    );
  }

  // Primary Color
  static TextStyle primaryColorMedium12 =
      createTextStyle(12, AppString.fontMedium, AppColor.primaryColor);
  static TextStyle primaryColorMedium16 =
      createTextStyle(16, AppString.fontMedium, AppColor.primaryColor);
  static TextStyle primaryColorMedium20 =
      createTextStyle(20, AppString.fontMedium, AppColor.primaryColor);
  static TextStyle primaryColorSemiBold12 =
      createTextStyle(12, AppString.fontMedium, AppColor.primaryColor);
  static TextStyle primaryColorSemiBold16 =
      createTextStyle(16, AppString.fontMedium, AppColor.primaryColor);
  static TextStyle primaryColorSemiBold20 =
      createTextStyle(20, AppString.fontMedium, AppColor.primaryColor);

  // Black Color
  static TextStyle blackMedium12 = createTextStyle(12, AppString.fontMedium, AppColor.black);
  static TextStyle blackMedium16 = createTextStyle(16, AppString.fontMedium, AppColor.black);
  static TextStyle blackMedium20 = createTextStyle(20, AppString.fontMedium, AppColor.black);
  static TextStyle blackSemiBold12 = createTextStyle(12, AppString.fontSemiBold, AppColor.black);
  static TextStyle blackSemiBold16 = createTextStyle(16, AppString.fontSemiBold, AppColor.black);
  static TextStyle blackSemiBold20 = createTextStyle(20, AppString.fontSemiBold, AppColor.black);
  static TextStyle blackSemiBold30 = createTextStyle(30, AppString.fontSemiBold, AppColor.black);

  // Blue Dark Color
  static TextStyle blueDarkMedium12 = createTextStyle(12, AppString.fontMedium, AppColor.blueDark);
  static TextStyle blueDarkMedium16 = createTextStyle(16, AppString.fontMedium, AppColor.blueDark);
  static TextStyle blueDarkMedium20 = createTextStyle(20, AppString.fontMedium, AppColor.blueDark);
  static TextStyle blueDarkSemiBold12 =
      createTextStyle(12, AppString.fontSemiBold, AppColor.blueDark);
  static TextStyle blueDarkSemiBold16 =
      createTextStyle(16, AppString.fontSemiBold, AppColor.blueDark);
  static TextStyle blueDarkSemiBold20 =
      createTextStyle(20, AppString.fontSemiBold, AppColor.blueDark);

  // White Color
  static TextStyle whiteMedium12 = createTextStyle(12, AppString.fontMedium, AppColor.white);
  static TextStyle whiteMedium16 = createTextStyle(16, AppString.fontMedium, AppColor.white);
  static TextStyle whiteMedium20 = createTextStyle(20, AppString.fontMedium, AppColor.white);
  static TextStyle whiteSemiBold12 = createTextStyle(12, AppString.fontSemiBold, AppColor.white);
  static TextStyle whiteSemiBold16 = createTextStyle(16, AppString.fontSemiBold, AppColor.white);
  static TextStyle whiteSemiBold20 = createTextStyle(20, AppString.fontSemiBold, AppColor.white);

  // Grey Light Color
  static TextStyle greyLightMedium12 =
      createTextStyle(12, AppString.fontMedium, AppColor.greyLight);
  static TextStyle greyLightMedium16 =
      createTextStyle(16, AppString.fontMedium, AppColor.greyLight);
  static TextStyle greyLightMedium20 =
      createTextStyle(20, AppString.fontMedium, AppColor.greyLight);
  static TextStyle greyLightSemiBold12 =
      createTextStyle(12, AppString.fontSemiBold, AppColor.greyLight);
  static TextStyle greyLightSemiBold16 =
      createTextStyle(16, AppString.fontSemiBold, AppColor.greyLight);
  static TextStyle greyLightSemiBold20 =
      createTextStyle(20, AppString.fontSemiBold, AppColor.greyLight);

  // Dark Grey Color
  static TextStyle greyDarkMedium12 = createTextStyle(12, AppString.fontMedium, AppColor.greyDark);
  static TextStyle greyDarkMedium16 = createTextStyle(16, AppString.fontMedium, AppColor.greyDark);
  static TextStyle greyDarkMedium20 = createTextStyle(20, AppString.fontMedium, AppColor.greyDark);
  static TextStyle greyDarkSemiBold12 =
      createTextStyle(12, AppString.fontSemiBold, AppColor.greyDark);
  static TextStyle greyDarkSemiBold16 =
      createTextStyle(16, AppString.fontSemiBold, AppColor.greyDark);
  static TextStyle greyDarkSemiBold20 =
      createTextStyle(20, AppString.fontSemiBold, AppColor.greyDark);
}
