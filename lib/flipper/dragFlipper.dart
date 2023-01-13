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

class _DragFlipperState extends State<DragFlipper>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  double dragX = 0, dragY = 0;
  bool isFront = true, isFrontStart = true;
  void Function(DragStartDetails)? onVerticalDragStart, onHorizontalDragStart;
  void Function(DragUpdateDetails)? onVerticalDragUpdate, onHorizontalDragUpdate;
  void Function(DragEndDetails)? onVerticalDragEnd, onHorizontalDragEnd;


  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    animationController.addListener(() {
      setState(() {
        dragX = animation.value;
        findSide();
      });
    });

    switch(widget.dragAxis){
      case DragAxis.horizontal:
        onHorizontalDragStart=horizontalDragStart;
        onHorizontalDragUpdate=horizontalDragUpdate;
        onHorizontalDragEnd=horizontalDragEnd;
        onVerticalDragStart= null;
        onVerticalDragUpdate=null;
        onVerticalDragEnd=null;
        break;
      case DragAxis.vertical:
        onHorizontalDragStart=null;
        onHorizontalDragUpdate=null;
        onHorizontalDragEnd=null;
        onVerticalDragStart= verticalDragStart;
        onVerticalDragUpdate=verticalDragUpdate;
        onVerticalDragEnd=verticalDragEnd;
        break;
      case DragAxis.both:
        // TODO: Handle this case.
        break;
    }


    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angleX = dragX / 180 * pi;
    final angleY = dragY / 180 * pi;

    final transformY = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angleY);

    final transformX = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(angleX);

    final transformXY = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(angleX)
      ..rotateY(angleY);

    return GestureDetector(
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform(
            transform: widget.dragAxis == DragAxis.horizontal
                ? transformY
                : widget.dragAxis == DragAxis.vertical
                    ? transformX
                    : transformXY,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 384,
                width: 240,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12 //12
                        ),
                decoration: BoxDecoration(
                    color: const Color(0xff0c0c0c),
                    borderRadius: BorderRadius.circular(8)),
                child: isFront
                    ? widget.frontSide
                    : Transform(
                        transform: widget.dragAxis == DragAxis.horizontal
                            ? (Matrix4.identity()..rotateY(pi))
                            : (Matrix4.identity()..rotateY(pi)),
                        alignment: Alignment.center,
                        child: widget.back,
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomPaint(
              foregroundPainter:
                  CircleBlurPainter(blurSigma: 11, width: getWidth())),
        ],
      ),
    );
  }

  void findSide() {
    if (dragX <= 90 || dragX >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }

  getWidth() {
    return dragX > 180 ? (130 + (180 - dragX) * 1.44) : 130 - (dragX * 1.44);
  }

  void verticalDragStart(DragStartDetails details) {
    animationController.stop();
    isFrontStart = isFront;
  }

  void verticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragX += details.delta.dy;
      dragX %= 360;
      findSide();
    });
  }

  void verticalDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dy.abs();
    if (velocity >= 100) {
      isFront = !isFrontStart;
    }
    animation = Tween<double>(
      begin: dragX,
      end: isFront ? (dragX > 180 ? 360 : 0) : 180,
    ).animate(animationController);
    animationController.forward(from: 0);
  }

  void horizontalDragStart(DragStartDetails details) {
    animationController.stop();
    isFrontStart = isFront;
  }

  void horizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragY -= details.delta.dx;
      dragY %= 360;
      findSide();
    });
  }

  void horizontalDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dx.abs();
    if (velocity >= 100) {
      isFront = !isFrontStart;
    }
    animation = Tween<double>(
      begin: dragY,
      end: isFront ? (dragY > 180 ? 360 : 0) : 180,
    ).animate(animationController);
    animationController.forward(from: 0);
  }
}
