import 'dart:math';
import 'dart:developer' as dev;
import 'package:flipper/constants/parameters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/blurPainter.dart';

class DragFlipper extends StatefulWidget {
  const DragFlipper(
      {super.key,
      required this.front,
      required this.back,
        this.height=384,
        this.width=240,
      this.dragAxis = DragAxis.horizontal,
        this.padding= const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        this.backgroundColor= const Color(0xff0c0c0c),
        this.borderRadius= const BorderRadius.all(Radius.circular(8.0)),
      });


  /// The [Widget] to be shown on the front of the Flipper. This is the first screen shown in Flipper.
  /// [front] can be an [Image.asset], [Container] or any other widgets.
  final Widget front;

  /// The [Widget] to be shown on the back of the Flipper. This is the back screen shown in Flipper.
  /// [back] can be an [Image.asset], [Container] or any other widgets.
  final Widget back;

  /// The [height] of the Flipper. The shadow is outside of the given height.
  /// The height is only for the interactive area of the Flipper. Defaults to 384.
  final double height;

  /// The [width] of the Flipper. The width is only for the interactive area of the Flipper.
  /// Defaults to 240.
  final double width;

  /// The [DragAxis] on which the Flipper should be dragged. This is not the axis of rotation.
  /// This is the axis of drag. Defaults to [DragAxis.horizontal].
  final DragAxis dragAxis;

  /// The [padding] to be applied inside the Flipper.
  ///
  /// Defaults to:
  /// ```dart
  /// const EdgeInsets.symmetric(vertical: 8, horizontal: 12)
  /// ```
  final EdgeInsets padding;

  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  @override
  State<DragFlipper> createState() => _DragFlipperState();
}

class _DragFlipperState extends State<DragFlipper>
    with SingleTickerProviderStateMixin {

  ///[AnimationController] to control the animation of the flipper after it is dragged. Used to restore
  ///the flipper to default state or straight state.
  late AnimationController animationController;

  ///[Animation] objects that control the animation of the flipper along the
  /// vertical and horizontal axis respectively. Controls where the flipper should be turning to after drag.
  late Animation<double> animationVertical, animationHorizontal;

  ///A [double] variable that stores the current drag value of the flipper along the horizontal and vertical axis.
  double dragHorizontal = 0, dragVertical = 0;

  ///[isFront] is a boolean variable that indicates whether the front side of the flipper is
  ///currently being displayed.
  bool isFront = true;

  ///[isFrontStart] is a boolean variable that indicates whether the front side of
  ///the flipper was displayed at the start of the drag gesture. Used for inverting side if ```velocity>100```
  bool isFrontStart = true;

  ///[isInverted] is a boolean variable that indicates whether the current viewport shows the flipper in
  ///inverted or vertically flipped view.
  bool isInverted=false;

  ///A function that is called when the drag gesture is updated.
  void Function(DragUpdateDetails)? onPanUpdate;

///A function that is called when the drag gesture is ended.
  void Function(DragEndDetails)? onPanEnd;

  ///[transform] is used to store the kind of transform needed for the Flipper. Value to be added inside build.
  late Matrix4 transform;
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    switch (widget.dragAxis) {
      case DragAxis.horizontal:
        onPanUpdate = horizontalDragUpdate;
        onPanEnd = horizontalDragEnd;
        animationController.addListener(() {
          setState(() {
            dragHorizontal = animationHorizontal.value;
            findSide();
          });
        });
        break;
      case DragAxis.vertical:
        onPanUpdate = verticalDragUpdate;
        onPanEnd = verticalDragEnd;
        animationController.addListener(() {
          setState(() {
            dragVertical = animationVertical.value;
            findSide();
          });
        });
        break;
      case DragAxis.both:
        onPanUpdate = bothDragUpdate;
        onPanEnd = bothDragEnd;
        animationController.addListener(() {
          setState(() {
            dragVertical = animationVertical.value;
            dragHorizontal = animationHorizontal.value;
            findSide();
          });
        });
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
    final angleHorizontal = dragHorizontal / 180 * pi;
    final angleVertical = dragVertical / 180 * pi;

    switch(widget.dragAxis){
      case DragAxis.horizontal:
        transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angleHorizontal);
        break;
      case DragAxis.vertical:
        transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(angleVertical);
        break;
      case DragAxis.both:
        transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(angleVertical)
          ..rotateY(angleHorizontal);
        break;
    }

    final transformHorizontal = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angleHorizontal);

    final transformVertical = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(angleVertical);

    final transformBoth = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(angleVertical)
      ..rotateY(angleHorizontal);

    return GestureDetector(
      onPanStart: (detail) {
        animationController.stop();
        isFrontStart = isFront;
      },
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform(
            transform: transform,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: widget.borderRadius,
              child: Container(
                height: widget.height,
                width: widget.width,
                padding: widget.padding,
                decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: widget.borderRadius,
                ),
                child: isFront
                    ? widget.front
                    : Transform(
                        transform: Matrix4.identity()..rotateY(pi),
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
    if (widget.dragAxis == DragAxis.horizontal) {
      if (dragHorizontal <= 90 || dragHorizontal >= 270) {
        isFront = true;
      } else {
        isFront = false;
      }
    } else
    if(widget.dragAxis==DragAxis.vertical)
    {
      if (dragVertical <= 90 || dragVertical >= 270) {
        isFront = true;
      } else {
        isFront = false;
      }
    }
    else{

      if((dragVertical <= 90 || dragVertical >= 270)&&(dragHorizontal <= 90 || dragHorizontal >= 270)) {
        isFront=true;
        isInverted=false;
      }
      else if((dragVertical > 90 && dragVertical < 270)&&(dragHorizontal > 90 && dragHorizontal < 270)) {
        isFront=true;
        isInverted=true;
      }
      else if((dragVertical > 90 && dragVertical < 270)&&(dragHorizontal <= 90 || dragHorizontal >= 270)) {
        isFront=false;
        isInverted=true;
      }
      else if((dragVertical <= 90 || dragVertical >= 270)&&(dragHorizontal > 90 && dragHorizontal < 270)) {
        isFront=false;
        isInverted=false;
      }

    }
  }

  getWidth() {
    return dragHorizontal > 180
        ? (130 + (180 - dragHorizontal) * 1.44)
        : 130 - (dragHorizontal * 1.44);
  }

  void verticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragVertical += details.delta.dy;
      dragVertical %= 360;
      findSide();
    });
  }

  void verticalDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dy.abs();
    if (velocity >= 100) {
      isFront = !isFrontStart;
    }
    animationVertical = Tween<double>(
      begin: dragVertical,
      end: isFront ? (dragVertical > 180 ? 360 : 0) : 180,
    ).animate(animationController);
    animationController.forward(from: 0);
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
    animationHorizontal = Tween<double>(
      begin: dragHorizontal,
      end: isFront ? (dragHorizontal > 180 ? 360 : 0) : 180,
    ).animate(animationController);
    animationController.forward(from: 0);
  }

  void bothDragUpdate(DragUpdateDetails details) {
    if(isInverted){
      dragHorizontal += details.delta.dx;
    }else {
      dragHorizontal -= details.delta.dx;
    }
    dragVertical += details.delta.dy;
    dragHorizontal %= 360;
    dragVertical %= 360;
    findSide();
    setState(() {

    });
  }

  void bothDragEnd(DragEndDetails details) {
    final yVelocity = details.velocity.pixelsPerSecond.dy.abs();
    final xVelocity = details.velocity.pixelsPerSecond.dx.abs();
    if ((yVelocity >= 100) || (xVelocity >= 100)) {
      isFront = !isFrontStart;
      if(yVelocity>xVelocity){
        isInverted=!isInverted;
      }
    }


    animationVertical = Tween<double>(
      begin: dragVertical,
      end: isInverted?180:(dragVertical > 180 ? 360 : 0),
    ).animate(animationController);

    animationHorizontal = Tween<double>(
      begin: dragHorizontal,
      end: isFront ? (isInverted?180:(dragHorizontal>180?360:0)) : isInverted ? (dragHorizontal>180?360:0):180,
    ).animate(animationController);

    animationController.forward(from: 0);
  }
}
