
# Flipper 🎡

Get ready to flip your widgets like never before!   Introducing Flipper - an interactive flipper widget for Flutter. Flipper is built to be highly customizable, easy to use and provides an intuitive way to flip between two sides of a card.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

To start using Flipper, you need to add the package to your pubspec.yaml file:

```yaml  
dependencies:  
   flipper: 0.0.4
```  
Import it:
```dart  
import 'package:flipper/flipper.dart';
```  

## Flipper Usage

### Draggable Flipper
The Draggable Flipper provides the option to flip the Widget using both hand gesture and by using a controller and its funtions. To use the Draggable Flipper, you need to wrap the widgets that you want to flip with `DragFlipper` widget.

```dart  
DragFlipper(  
  front: FrontWidget(),  //required
  back: BackWidget(),  //required
  controller: flipperController,  //required
  height: double,  
  width: double,  
  padding: EdgeInsets,  
  margin: EdgeInsets,  
  backgroundColor: Color,  
  border: Border,  
  borderRadius: BorderRadius,  
  gradient: Gradient,  
  shape: BoxShape,  
)  
```  

### Regular Flipper
The Regular Flipper provides the option to flip the Widget only by using a controller and its funtions. To use the Draggable Flipper, you need to wrap the widgets that you want to flip with `DragFlipper` widget.

```dart  
Flipper(  
  front: FrontWidget(),  //required
  back: BackWidget(),  //required
  controller: flipperController,  //required
  height: double,  
  width: double,  
  padding: EdgeInsets,  
  margin: EdgeInsets,  
  backgroundColor: Color,  
  border: Border,  
  borderRadius: BorderRadius,  
  gradient: Gradient,  
  shape: BoxShape,  
)  
```  
## Controller Usage
The FlipperController is a required parameter for both Flipper and DragFlipper. It allows you to control the animation of the flipper manually and programmatically. You can use the `controller` to add programmatic buttons, for example, to flip the flipper to the left or right.
A FipperController() accepts a dragAxis paramter which defaults to `DragAxis.horizontal`.

```dart  
FlipperController controller= FlipperController(  
  dragAxis: DragAxis.both,  
);
```  
### Methods

The `FlipperController` has three main methods:

-   `flipLeft()`: Flips the flipper to the left for one time. Only works with `DragAxis.horizontal` and `DragAxis.both`.
-   `flipRight()`: Flips the flipper to the right for one time. Only works with `DragAxis.horizontal` and `DragAxis.both`.
-   `flipDown()`: Flips the flipper to the bottom for one time. Only works with `DragAxis.vertical` and `DragAxis.both`.
-    `flipUp()`: Flips the flipper to the top for one time. Only works with `DragAxis.vertical` and `DragAxis.both`.

Please note that, if `dragAxis` is set to `DragAxis.vertical`, you can only call `flipDown()` and `flipUp()` and if it is set to `DragAxis.horizontal`, you can only call `flipLeft()` and `flipRight()`.

### Example

Here is an example of how to use the `FlipperController` to add a programmatic button to flip the flipper to the left.

```dart
FlipperController flipperController= FlipperController(  
  dragAxis: DragAxis.horizontal,  
);

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: DragFlipper(
      controller: _flipperController,
      front: Text('Front'),
      back: Text('Back'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => flipperController.flipLeft(),
      child: Icon(Icons.arrow_back),
    ),
  );
} 
```


## Additional information

TODO: Tell users more about the package: where to find more information, how to  
contribute to the package, how to file issues, what response they can expect  
from the package authors, and more.