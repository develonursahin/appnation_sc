import 'package:flutter/material.dart';

extension MediaQuerySizeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get border8Radius => BorderRadius.circular(8.0);
  BorderRadius get border12Radius => BorderRadius.circular(12.0);
  //Vertical Top
  BorderRadius get borderVerticalTop8Radius =>
      const BorderRadius.vertical(top: Radius.circular(8.0));
  BorderRadius get borderVerticalTop12Radius =>
      const BorderRadius.vertical(top: Radius.circular(12.0));
  //Vertical Bottom
  BorderRadius get borderVerticalBottom8Radius =>
      const BorderRadius.vertical(bottom: Radius.circular(8.0));
  BorderRadius get borderVerticalBottom12Radius =>
      const BorderRadius.vertical(bottom: Radius.circular(12.0));
  //Left Bottom Right Top
  BorderRadius get borderBottomLeftTopRight8Radius =>
      const BorderRadius.only(bottomLeft: Radius.circular(8.0), topRight: Radius.circular(8.0));
  BorderRadius get borderBottomRightTopLeft8Radius =>
      const BorderRadius.only(bottomRight: Radius.circular(8.0), topLeft: Radius.circular(8.0));
  BorderRadius get borderBottomLeft8TopRight16Radius =>
      const BorderRadius.only(bottomLeft: Radius.circular(8.0), topRight: Radius.circular(16.0));
}
