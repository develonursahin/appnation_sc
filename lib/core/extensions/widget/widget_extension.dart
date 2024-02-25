import 'package:flutter/material.dart';

extension SizedBoxExtension on Widget {
  SizedBox sized({double? width, double? height}) => SizedBox(
        height: height,
        width: width,
        child: this,
      );
}

extension OnTapExtension on Widget {
  GestureDetector gestureDetector({Function()? onTap}) => GestureDetector(
        onTap: onTap,
        child: this,
      );
}

extension PaddingExtension on Widget {
  Padding pAll(double val) => Padding(
        padding: EdgeInsets.all(val),
        child: this,
      );

  Padding pOnly({double? top, double? bottom, double? left, double? right}) => Padding(
        padding: EdgeInsets.only(
            top: top ?? 0.0, bottom: bottom ?? 0.0, left: left ?? 0.0, right: right ?? 0.0),
        child: this,
      );

  Padding pSymmetric({double? horizontal, double? vertical}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0),
        child: this,
      );
}

extension AlignmentExtension on Widget {
  Align align({AlignmentGeometry alignment = Alignment.center}) => Align(
        alignment: alignment,
        child: this,
      );
  Align center() => Align(
        alignment: Alignment.center,
        child: this,
      );
  Align centerLeft() => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );
  Align centerRight() => Align(
        alignment: Alignment.centerRight,
        child: this,
      );
  Align topCenter() => Align(
        alignment: Alignment.topCenter,
        child: this,
      );
  Align bottomCenter() => Align(
        alignment: Alignment.bottomCenter,
        child: this,
      );
  Align bottomLeft() => Align(
        alignment: Alignment.bottomLeft,
        child: this,
      );
  Align bottomRight() => Align(
        alignment: Alignment.bottomRight,
        child: this,
      );
  Align topRight() => Align(
        alignment: Alignment.topRight,
        child: this,
      );
  Align topLeft() => Align(
        alignment: Alignment.topLeft,
        child: this,
      );
}
