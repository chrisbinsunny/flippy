
import 'package:flipper/constants/parameters.dart';
import 'package:flipper/controllers/flipperController.dart';
import 'package:flutter/animation.dart';

class VerticalFlipperController extends FlipperController{

  VerticalFlipperController():super(dragAxis: DragAxis.horizontal);






  ///Flips the Flipper to the Bottom for one time.
  ///Only works with [DragAxis.vertical] and [DragAxis.both].
  void flipDown(){

    assert(super.state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.horizontal),
    'Cannot call flipDown() when the dragAxis is set to DragAxis.horizontal!'
        '\nUse DragAxis.vertical or DragAxis.both');


    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    if(dragAxis==DragAxis.both) {
      super.state!.animationHorizontal= AlwaysStoppedAnimation<double>(super.state!.dragHorizontal);
    }

    super.state!.animationVertical= Tween<double>(
      begin: super.state!.isInverted?180:0,
      end: super.state!.isInverted?360:180,
    ).animate(super.state!.animationController);

    super.state!.animationController.forward(from: 0);

  }

  ///Flips the Flipper to the Top for one time.
  ///Only works with [DragAxis.vertical] and [DragAxis.both].
  void flipUp(){

    assert(super.state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.horizontal),
    'Cannot call flipUp() when the dragAxis is set to DragAxis.horizontal!'
        '\nUse DragAxis.vertical or DragAxis.both');


    ///For DragAxis.both
    ///Initialising the unused animation with the current value.

    if(dragAxis==DragAxis.both) {
      super.state!.animationHorizontal= AlwaysStoppedAnimation<double>(super.state!.dragHorizontal);
    }



    super.state!.animationVertical= Tween<double>(
      begin: super.state!.isInverted?180:360,
      end:   super.state!.isInverted?0:180,
    ).animate(super.state!.animationController);

    super.state!.animationController.forward(from: 0);

  }
}

