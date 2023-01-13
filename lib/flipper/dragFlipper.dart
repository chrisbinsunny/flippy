import 'dart:math';

import 'package:flipper/constants/parameters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../components/blurPainter.dart';


class DragFlipper extends StatefulWidget {
  const DragFlipper(
      {super.key,
        required this.frontSide,
        required this.back,
        this.dragAxis = DragAxis.horizontal});

  final Widget frontSide;
  final Widget back;
  final DragAxis dragAxis;
  @override
  State<DragFlipper> createState() => _DragFlipperState();
}

class _DragFlipperState extends State<DragFlipper> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> animation;
  double dragHorizontal = 0;
  bool isFront = true, isFrontStart=true;
  void Function(DragStartDetails)? onVerticalDragStart, onHorizontalDragStart;
  void Function(DragUpdateDetails)? onVerticalDragUpdate, onHorizontalDragUpdate;
  void Function(DragEndDetails)? onVerticalDragEnd, onHorizontalDragEnd;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration (milliseconds: 500),
      vsync: this,
    );

    animationController.addListener(() {
      setState(() {
        dragHorizontal = animation.value;
        findSide();
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = dragHorizontal / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angle);
    return GestureDetector(
      onHorizontalDragStart: horizontalDragStart,
      onHorizontalDragUpdate: horizontalDragUpdate,
      onHorizontalDragEnd: horizontalDragEnd,
      onVerticalDragStart: null,
      onVerticalDragUpdate: null,
      onVerticalDragEnd: null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          Transform(
            transform: transform,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 384,
                width: 240,
                padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12  //12
                ),
                decoration: BoxDecoration(
                    color: const Color(0xff0c0c0c),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: isFront ?
                widget.frontSide :
                Transform(
                  transform: Matrix4.identity()
                    ..rotateY(pi),
                  alignment: Alignment.center,
                  child: widget.back,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomPaint(foregroundPainter: CircleBlurPainter( blurSigma: 11, width: getWidth())),
        ],
      ),
    );
  }


  void findSide() {
    if (dragHorizontal <= 90 || dragHorizontal >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }

  getWidth(){
    return dragHorizontal>180?(130+(180-dragHorizontal)*1.44):130-(dragHorizontal*1.44);
  }


  // void verticalDragStart(DragStartDetails details) {
  //   animationController.stop();
  //   isFrontStart = isFront;
  // }
  //
  // void verticalDragUpdate(DragUpdateDetails details) {
  //   setState(() {
  //     dragX += details.delta.dy;
  //     dragX %= 360;
  //     findSide();
  //   });
  // }
  //
  // void verticalDragEnd(DragEndDetails details) {
  //   final velocity = details.velocity.pixelsPerSecond.dy.abs();
  //   if (velocity >= 100) {
  //     isFront = !isFrontStart;
  //   }
  //   animation = Tween<double>(
  //     begin: dragX,
  //     end: isFront ? (dragX > 180 ? 360 : 0) : 180,
  //   ).animate(animationController);
  //   animationController.forward(from: 0);
  // }

  void horizontalDragStart(DragStartDetails details) {
    animationController.stop();
    isFrontStart = isFront;
  }

  void horizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragHorizontal -= details.delta.dx;
      dragHorizontal %= 360;
      findSide();
    });
  }

  void horizontalDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dx.abs();
    if (velocity >= 100) {
      isFront = !isFrontStart;
    }
    animation = Tween<double>(
      begin: dragHorizontal,
      end: isFront ? (dragHorizontal > 180 ? 360 : 0) : 180,
    ).animate(animationController);
    animationController.forward(from: 0);
  }

}