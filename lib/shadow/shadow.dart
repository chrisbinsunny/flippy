
import 'package:flutter/material.dart';

class FlipperShadow extends StatelessWidget {
  const FlipperShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        foregroundPainter:
        CircleBlurPainter(blurSigma: 11, width: getWidth())),;
  }
}
