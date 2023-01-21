
import 'package:flipper/constants/parameters.dart';
import 'package:flipper/controllers/flipperController.dart';
import 'package:flutter/animation.dart';

class HorizontalFlipperController extends FlipperController{

  HorizontalFlipperController():super(dragAxis: DragAxis.horizontal);


  ///Flips the Flipper to the Left for one time.
  ///Only works with [DragAxis.horizontal] and [DragAxis.both].
  void flipLeft() {

    assert(super.state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.vertical),
    'Cannot call flipLeft() when the dragAxis is set to DragAxis.vertical!'
        '\nUse DragAxis.horizontal or DragAxis.both');

    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    if(dragAxis==DragAxis.both) {
      super.state!.animationVertical =
          AlwaysStoppedAnimation<double>(super.state!.dragVertical);
    }


    super.state!.animationHorizontal= Tween<double>(
      begin: super.state!.isFront?0:180,
      end: super.state!.isFront?180:360,
    ).animate(super.state!.animationController);
    if(super.state!.isInverted) {
      super.state!.animationController.reverse(from: 1);
    }else{
      super.state!.animationController.forward(from: 0);
    }

  }

  ///Flips the Flipper to the Right for one time.
  ///Only works with [DragAxis.horizontal] and [DragAxis.both].
  void flipRight(){

    assert(super.state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.vertical),
    'Cannot call flipRight() when the dragAxis is set to DragAxis.vertical!'
        '\nUse DragAxis.horizontal or DragAxis.both');

    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    if(dragAxis==DragAxis.both) {
      super.state!.animationVertical= AlwaysStoppedAnimation<double>(super.state!.dragVertical);
    }

    super.state!.animationHorizontal= Tween<double>(
      begin: super.state!.isFront?360:180,
      end: super.state!.isFront?180:0,
    ).animate(super.state!.animationController);

    if(super.state!.isInverted) {
      super.state!.animationController.reverse(from: 1);
    }else{
      super.state!.animationController.forward(from: 0);
    }

  }
}

