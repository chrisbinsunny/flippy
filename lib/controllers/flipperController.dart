import 'package:flipper/constants/parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../flipper/dragFlipper.dart';
import 'dart:developer' as dev;


class FlipperController extends ChangeNotifier {

  FlipperController({
    this.dragAxis = DragAxis.horizontal,
  });


  DragFlipperState? _state;

  /// The internal widget state.
  /// Use only if you know what you're doing!
  set state(DragFlipperState? value) {
    _state = value;
  }

  /// The [DragAxis] on which the Flipper should be dragged. This is not the axis of rotation.
  /// This is the axis of drag. Defaults to [DragAxis.horizontal].
  final DragAxis dragAxis;

//TODO left and right is working. Other two not working

  ///Flips the Flipper to the Left for one time.
  ///Only works with
  /// ```dart
  /// DragAxis.horizontal
  /// ```
  /// and
  /// ```dart
  /// DragAxis.vertical
  /// ```
  void flipLeft() {

    assert(_state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.vertical),
    'Could not call flipUp() when the dragAxis is set to DragAxis.vertical!'
        '\nUse DragAxis.horizontal or DragAxis.both');

    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    _state!.animationVertical= AlwaysStoppedAnimation<double>(_state!.dragVertical);



    _state!.animationHorizontal= Tween<double>(
      begin: _state!.isFront?0:180,
      end: _state!.isFront?180:360,
    ).animate(_state!.animationController);
    if(_state!.isInverted) {
      _state!.animationController.reverse(from: 1);
    }else{
      _state!.animationController.forward(from: 0);
    }
  }

  ///Flips the Flipper to the Right for one time.
  ///Only works with
  /// ```dart
  /// DragAxis.horizontal
  /// ```
  /// and
  /// ```dart
  /// DragAxis.vertical
  /// ```
  void flipRight(){

    assert(_state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.vertical),
    'Could not call flipUp() when the dragAxis is set to DragAxis.vertical!'
        '\nUse DragAxis.horizontal or DragAxis.both');

    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    _state!.animationVertical= AlwaysStoppedAnimation<double>(_state!.dragVertical);
    _state!.animationHorizontal= Tween<double>(
      begin: _state!.isFront?360:180,
      end: _state!.isFront?180:0,
    ).animate(_state!.animationController);

    if(_state!.isInverted) {
      _state!.animationController.reverse(from: 1);
    }else{
      _state!.animationController.forward(from: 0);
    }

  }

  ///Flips the Flipper to the Bottom for one time.
  ///Only works with
  /// ```dart
  /// DragAxis.vertical
  /// ```
  /// and
  /// ```dart
  /// DragAxis.vertical
  /// ```
  void flipDown(){

    assert(_state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.horizontal),
    'Could not call flipDown() when the dragAxis is set to DragAxis.horizontal!'
        '\nUse DragAxis.vertical or DragAxis.both');


    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    _state!.animationHorizontal= AlwaysStoppedAnimation<double>(_state!.dragHorizontal);
    _state!.animationVertical= Tween<double>(
      begin: _state!.isFront?0:180,
      end: _state!.isFront?180:360,
    ).animate(_state!.animationController);

    _state!.animationController.forward(from: 0);

  }

  ///Flips the Flipper to the Top for one time.
  ///Only works with
  /// ```dart
  /// DragAxis.vertical
  /// ```
  /// and
  /// ```dart
  /// DragAxis.vertical
  /// ```
  void flipUp(){

    assert(_state != null,
    'Controller not attached to any Flipper. Seems that you forget to attach controller to Flipper.');
    assert((dragAxis!=DragAxis.horizontal),
    'Could not call flipUp() when the dragAxis is set to DragAxis.horizontal!'
        '\nUse DragAxis.vertical or DragAxis.both');


    ///For DragAxis.both
    ///Initialising the unused animation with the current value.
    _state!.animationHorizontal= AlwaysStoppedAnimation<double>(_state!.dragHorizontal);




    _state!.animationVertical= Tween<double>(
      begin: _state!.isFront?360:180,
      end: _state!.isFront?180:0,
    ).animate(_state!.animationController);

    _state!.animationController.forward(from: 0);

  }

}