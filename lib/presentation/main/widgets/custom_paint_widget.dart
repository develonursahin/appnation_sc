import 'package:appnation_sc/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class TrapezoidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColor.greyLight;

    final path = Path()
      ..moveTo(size.width * 0.05, 0)
      ..lineTo(size.width * 0.1, -8)
      ..lineTo(size.width * 0.9, -8)
      ..lineTo(size.width * 0.95, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
