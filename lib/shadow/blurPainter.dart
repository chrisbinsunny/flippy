import 'package:flutter/material.dart';

class FlipperShadowPainter extends CustomPainter {
  FlipperShadowPainter({
    required this.blurSigma,
    required this.width,
    required this.color,
    required this.height,
  });

  final double blurSigma, width, height;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    canvas.drawOval(Rect.fromLTRB(-(width), 3, width, height + 3), line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
