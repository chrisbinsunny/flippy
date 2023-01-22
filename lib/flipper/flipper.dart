import 'dart:math';
import 'dart:developer' as dev;
import 'package:flipper/flipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/blurPainter.dart';
import '../controllers/flipperController.dart';

class Flipper extends StatefulWidget {
  const Flipper(
      {super.key,
      required this.front,
      required this.back,
        required this.controller,
        this.height=220,
        this.width=324,
        this.border,
        this.padding= const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        this.margin,
        this.backgroundColor= const Color(0xff0c0c0c),
        this.borderRadius,
        this.gradient,
        this.shape=BoxShape.rectangle
      }):
        assert(shape != BoxShape.circle || borderRadius == null);


  /// The [controller] that controls the animation of the flipper manually. Use the [controller] to
  /// add programmatic buttons. Pass the direction of Drag to the controller.
  /// It is a required parameter.
  ///
  final FlipperController controller;


  /// The [Widget] to be shown on the front of the Flipper.
  ///
  /// This is the first screen shown in Flipper. [front] can be an [Image.asset], [Container] or any other widgets.
  final Widget front;

  /// The [Widget] to be shown on the back of the Flipper.
  ///
  /// This is the back screen shown in Flipper.
  /// [back] can be an [Image.asset], [Container] or any other widgets.
  final Widget? back;

  /// The [height] of the Flipper.
  ///
  /// The shadow is outside of the given height.
  /// The height is only for the interactive area of the Flipper. Defaults to 384.
  final double height;

  /// The [width] of the Flipper.
  ///
  /// The width is only for the interactive area of the Flipper.
  /// Defaults to 240.
  final double width;



  /// The [padding] to be applied inside the Flipper.
  ///
  /// Defaults to:
  /// ```dart
  /// const EdgeInsets.symmetric(vertical: 8, horizontal: 12)
  /// ```
  final EdgeInsets padding;

  /// The [margin] to be applied outside the Flipper.

  final EdgeInsets? margin;

  /// The [border] to be added to the Flipper.
  ///
  /// A uniform Border is required for a borderRadius.
  /// Make sure to give uniform border if borderRadius>0
  ///
  final Border? border;

  /// The color to fill in the background of the flipper.
  ///
  /// The color is filled into the [shape] of the box (e.g., either a rectangle,
  /// potentially with a [borderRadius], or a circle).
  ///
  /// This is ignored if [gradient] is non-null.
  ///
  final Color backgroundColor;

  /// If non-null, the corners of this box are rounded by this [BorderRadius].
  ///
  /// Applies only to boxes with rectangular shapes; error if [shape] is not
  /// [BoxShape.rectangle].
  ///
  final BorderRadiusGeometry? borderRadius;

  /// A gradient to use when filling the box.
  ///
  /// If this is specified, [backgroundColor] has no effect.
  ///
  final Gradient? gradient;

  /// The shape to fill the background [color], [gradient], and [image] into.
  ///
  /// If this is [BoxShape.circle] then [borderRadius] is ignored.
  /// Defaults to [BoxShape.rectangle].
  final BoxShape shape;

  @override
  State<Flipper> createState() => FlipperState();
}

class FlipperState extends State<Flipper>
    with SingleTickerProviderStateMixin {

  ///[AnimationController] to control the animation of the flipper after it is dragged.
  ///
  /// Used to restore the flipper to default state or straight state.
  late AnimationController animationController;

  ///Controls and returns double value of animation.
  ///
  ///
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

  ///[transform] is used to store the kind of transform needed for the Flipper. Value to be added inside build.
  late Matrix4 transform;


  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,

    );
    switch (widget.controller.dragAxis) {
      case DragAxis.horizontal:
        animationController.addListener(() {
          setState(() {
            dragHorizontal = animationHorizontal.value;
            findSide();
          });
        });
        break;
      case DragAxis.vertical:
        animationController.addListener(() {
          setState(() {
            dragVertical = animationVertical.value;
            findSide();
          });
        });
        break;
      case DragAxis.both:
        animationController.addListener(() {
          setState(() {
            dragVertical = animationVertical.value;
            dragHorizontal = animationHorizontal.value;
            findSide();
          });
        });
        break;
    }

    widget.controller.state= this as DragFlipperState?;
    super.initState();
  }

  @override
  void didUpdateWidget(Flipper oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.controller.state= this as DragFlipperState?;
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

dev.log("$dragHorizontal, $dragVertical");
    switch(widget.controller.dragAxis){
      case DragAxis.horizontal:
        transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(dragHorizontal / 180 * pi);
        break;
      case DragAxis.vertical:
        transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(dragVertical / 180 * pi);
        break;
      case DragAxis.both:
        transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(dragVertical / 180 * pi)
          ..rotateY(dragHorizontal / 180 * pi);
        break;
    }


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform(
          transform: transform,
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: widget.borderRadius??BorderRadius.zero,
            child: Container(
              height: widget.height,
              width: widget.width,
              padding: widget.padding,
              margin: widget.margin,

              decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: widget.borderRadius,
                border: widget.border,
                gradient: widget.gradient,
                shape: widget.shape,
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
    );
  }


  ///The [findSide] method is a helper function used to determine which side of the [Flipper] is
  ///logically to be displayed. It uses the current [dragHorizontal] and [dragVertical] values, as well as
  /// the [dragAxis] property to determine whether the [front] or [back] side of the [Flipper] is to be displayed.
  ///
  /// The method updates the following properties:
  ///
  /// [isFront] : A boolean property indicating whether the front side of the DragFlipper is
  /// currently being displayed.
  /// [isInverted] : A boolean property indicating whether the flipper is currently being displayed in
  /// an inverted or a normal view.
  ///
  /// The [findSide] method is called inside the [animationController.addListener] method in the
  /// [initState] function and [onPanUpdate] function, thus it will be called every time the flipper
  /// is dragged manually or by [animationController].
  ///
  ///
  /// This function is important for the correct functioning of the DragFlipper widget and should not be
  /// modified or removed unless absolutely necessary.
  void findSide() {
    if (widget.controller.dragAxis == DragAxis.horizontal) {
      if (dragHorizontal <= 90 || dragHorizontal >= 270) {
        isFront = true;
      } else {
        isFront = false;
      }
    } else
    if(widget.controller.dragAxis==DragAxis.vertical)
    {
      if (dragVertical <= 90 || dragVertical >= 270) {
        isFront = true;
        isInverted=false;
      } else {
        isFront = false;
        isInverted=true;
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


  ///For finding width for shadow.
  //TODO
  getWidth() {
    return dragHorizontal > 180
        ? (130 + (180 - dragHorizontal) * 1.44)
        : 130 - (dragHorizontal * 1.44);
  }

}
