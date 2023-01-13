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

  late AnimationController animationController;
  late Animation<double> animation;
  double drag = 0;
  bool isFront = true, isFrontStart=true;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration (milliseconds: 500),
      vsync: this,
    );

    animationController.addListener(() {
      setState(() {
        drag = animation.value;
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
    final angle = drag / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angle);
    return GestureDetector(
      onHorizontalDragStart: (details){
        animationController.stop();
        isFrontStart= isFront;
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          drag -= details.delta.dx;
          drag %= 360;
          findSide();
        });
      },
      onHorizontalDragEnd: (details){
        final velocity= details.velocity.pixelsPerSecond.dx.abs();
        if (velocity >= 100) {
          isFront = !isFrontStart;
        }
        animation = Tween<double>(
          begin: drag,
          end: isFront? (drag > 180 ? 360:0):180,
        ).animate (animationController);
        animationController.forward(from: 0);
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
    if (drag <= 90 || drag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }

  getWidth(){
    return drag>180?(130+(180-drag)*1.44):130-(drag*1.44);
  }


}
