import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/blurPainter.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key, required this.frontSide, required this.back});

  final Widget frontSide;
  final Widget back;
  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;
  double dragPosition = 0;
  bool isFront = true, isFrontStart=true;

  Widget frontSide= Container();
  Widget back = Container();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration (milliseconds: 500),
      vsync: this,
    );

    controller.addListener(() {
      setState(() {
        dragPosition = animation.value;
        setImageSide();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angle);
    return GestureDetector(
      onHorizontalDragStart: (details){
        controller.stop();
        isFrontStart= isFront;
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          dragPosition -= details.delta.dx;
          dragPosition %= 360;
          setImageSide();
        });
      },
      onHorizontalDragEnd: (details){
        final velocity= details.velocity.pixelsPerSecond.dx.abs();
        if (velocity >= 100) {
          isFront = !isFrontStart;
        }
        animation = Tween<double>(
          begin: dragPosition,
          end: isFront? (dragPosition > 180 ? 360:0):180,
        ).animate (controller);
        controller.forward(from: 0);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          Transform(
            transform: transform,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
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
          const SizedBox(
            height: 30,
          ),
          CustomPaint(foregroundPainter: CircleBlurPainter( blurSigma: 11, width: getWidth())),
        ],
      ),
    );
  }


  void setImageSide() {
    if (dragPosition <= 90 || dragPosition >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }

  getWidth(){
    return dragPosition>180?(130+(180-dragPosition)*1.44):130-(dragPosition*1.44);
  }


}
