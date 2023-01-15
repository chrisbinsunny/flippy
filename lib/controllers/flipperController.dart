import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../flipper/dragFlipper.dart';
import 'dart:developer' as dev;


class FlipperController extends ChangeNotifier {
  /// The internal widget state.
  /// Use only if you know what you're doing!
  DragFlipperState? state;

  /// The underlying AnimationController.
  /// Use only if you know what you're doing!
  AnimationController? get controller {
    assert(state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    return state!.animationController;
  }


  void flipLeft(){

    assert(state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');

    state!.animationHorizontal= Tween<double>(
      begin: state!.isFront?0:180,
      end: state!.isFront?180:360,
    ).animate(state!.animationController);
    state!.animationController.forward(from: 0);

  }

  void flipRight(){

    assert(state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');

    state!.animationHorizontal= Tween<double>(
      begin: state!.isFront?360:180,
      end: state!.isFront?180:0,
    ).animate(state!.animationController);
    state!.animationController.forward(from: 0);

  }

}