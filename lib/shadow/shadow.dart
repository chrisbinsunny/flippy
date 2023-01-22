
import 'package:flipper/controllers/flipperController.dart';
import 'package:flutter/material.dart';

import 'blurPainter.dart';

class FlipperShadow extends StatelessWidget {
  const FlipperShadow({
    Key? key,
    required this.controller,
    this.blurSigma=11,
    this. height= 7,
    this.color=const Color(0xff8a8a8a),
    this.spacing= 30

  }) : super(key: key);

  final FlipperController controller;
  final double blurSigma, height, spacing;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: spacing
      ),
      child: CustomPaint(

        painter: FlipperShadowPainter(
          blurSigma: blurSigma,
          width: controller.getWidth(),
          color: color,
          height:height,
        ),
          ),
    );
  }



}
