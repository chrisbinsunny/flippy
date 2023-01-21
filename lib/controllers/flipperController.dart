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

  DragFlipperState? get state => _state;

  /// The internal widget state.
  /// Use only if you know what you're doing!
  set state(DragFlipperState? value) {
    _state = value;
  }

  /// The [DragAxis] on which the Flipper should be dragged. This is not the axis of rotation.
  /// This is the axis of drag. Defaults to [DragAxis.horizontal].
  final DragAxis dragAxis;



}