import 'package:flutter/material.dart';

class CircleBlurPainter extends CustomPainter {

  CircleBlurPainter({required this.blurSigma, required this.width});

  double blurSigma, width;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = const Color(0xff8a8a8a)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    canvas.drawOval(Rect.fromLTRB(-(width), 3, width, 10), line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}