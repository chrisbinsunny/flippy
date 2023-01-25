import 'dart:developer';

import 'package:flippy/constants/parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class FlipperController extends ChangeNotifier {

  FlipperController({
    this.dragAxis = DragAxis.horizontal,
  });
  dynamic _state;


  /// The internal widget state.
  /// Use only if you know what you're doing!
  set state(dynamic value) {
    _state = value;
  }

  /// The [DragAxis] on which the Flipper should be dragged. This is not the axis of rotation.
  /// This is the axis of drag. Defaults to [DragAxis.horizontal].
  final DragAxis dragAxis;




  ///Flips the Flipper to the Left for one time.
  ///Only works with [DragAxis.horizontal] and [DragAxis.both].
  void flipLeft() {

    assert(_state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.vertical),
    'Cannot call flipLeft() when the dragAxis is set to DragAxis.vertical!'
        '\nUse DragAxis.horizontal or DragAxis.both');

    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    if(dragAxis==DragAxis.both) {
      _state!.animationVertical =
          AlwaysStoppedAnimation<double>(_state!.dragVertical);
    }


    _state!.animationHorizontal= Tween<double>(
      begin: _state!.isFront?0:180,
      end: _state!.isFront?180:360,
    ).animate(_state!.animationController);
    if(_state!.isInverted) {
      _state!.animationController.reverse(from: 1.0);
    }else{
      _state!.animationController.forward(from: 0.0);
    }

  }

  ///Flips the Flipper to the Right for one time.
  ///Only works with [DragAxis.horizontal] and [DragAxis.both].
  void flipRight(){

    assert(_state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.vertical),
    'Cannot call flipRight() when the dragAxis is set to DragAxis.vertical!'
        '\nUse DragAxis.horizontal or DragAxis.both');

    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    if(dragAxis==DragAxis.both) {
    _state!.animationVertical= AlwaysStoppedAnimation<double>(_state!.dragVertical);
    }

    _state!.animationHorizontal= Tween<double>(
      begin: _state!.isFront?360:180,
      end: _state!.isFront?180:0,
    ).animate(_state!.animationController);

    if(_state!.isInverted) {
      _state!.animationController.reverse(from: 1.0);
    }else{
      _state!.animationController.forward(from: 0.0);
    }

  }

  ///Flips the Flipper to the Bottom for one time.
  ///Only works with [DragAxis.vertical] and [DragAxis.both].
  void flipDown(){

    assert(_state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.horizontal),
    'Cannot call flipDown() when the dragAxis is set to DragAxis.horizontal!'
        '\nUse DragAxis.vertical or DragAxis.both');


    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    if(dragAxis==DragAxis.both) {
      _state!.animationHorizontal= AlwaysStoppedAnimation<double>(_state!.dragHorizontal);
    }

    _state!.animationVertical= Tween<double>(
      begin: _state!.isInverted?180:0,
      end: _state!.isInverted?360:180,
    ).animate(_state!.animationController);

    _state!.animationController.forward(from: 0.0);

  }

  ///Flips the Flipper to the Top for one time.
  ///Only works with [DragAxis.vertical] and [DragAxis.both].
  void flipUp(){

    assert(_state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.horizontal),
    'Cannot call flipUp() when the dragAxis is set to DragAxis.horizontal!'
        '\nUse DragAxis.vertical or DragAxis.both');


    ///For DragAxis.both
    ///Initialising the unused animation with the current value.

    if(dragAxis==DragAxis.both) {
    _state!.animationHorizontal= AlwaysStoppedAnimation<double>(_state!.dragHorizontal);
    }



    _state!.animationVertical= Tween<double>(
      begin: _state!.isInverted?180:360,
      end:   _state!.isInverted?0:180,
    ).animate(_state!.animationController);

    _state!.animationController.forward(from: 0.0);

  }


}