// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension StringExtension on String {
  String capitalizeEachWord() {
    return split(' ')
        .map((word) =>
            word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}' : word)
        .join(' ');
  }
}

extension SvgExtension on String {
  Widget get toSvg => SvgPicture.asset(this);
  Widget toColorSvg({Color? color}) => SvgPicture.asset(this, color: color);
}

extension ImagesExtension on String {
  Widget get toImage => Image.asset(
        this,
        fit: BoxFit.fill,
      );
  AssetImage get toImageProvider => AssetImage(this);
}
