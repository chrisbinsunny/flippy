
# Flippy- Flip it 🎡

Get ready to flip your widgets like never before!   Introducing Flippy - an interactive flip widget for Flutter. Flippy is built to be highly customizable, easy to use and provides an intuitive way to flip between two sides of a card.


## Getting started

To start using Flippy, you need to add the package to your pubspec.yaml file:

```yaml  
dependencies:  
   flipper: 0.1.0
```  
Import it:
```dart  
import 'package:flippy/flippy.dart';
```  

## Features

✅ Draggable and Non-Draggable flipper cards
✅ Funtions to turn to all sides
✅ Dynamic customisable shadow
✅ Complete control over widgets

**TODO: Coming Soon**
🟩 Animation duration
🟩 Stop sticky animation
🟩 Single widget flip
🟩 Sounds on flip

## Flippy Usage

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
The Regular Flipper provides the option to flip the Widget only by using a controller and its funtions. Dragging or gestures is not supported in Regular Flipper. To use the Draggable Flipper, you need to wrap the widgets that you want to flip with `DragFlipper` widget.

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
The FlipperController is a required parameter for both Flipper and DragFlipper. Controller allows you to control the animation of the flipper manually and programmatically. You can use the `controller` to add programmatic buttons, for example, to flip the flipper to the left or right.
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

Find the documentation and API References [here](https://pub.dev/documentation/flippy/latest/)

### Issues
Report the found issues [here](https://github.com/chrisbinsunny/flippy/issues).

###  Contributing

1. Fork it (<https://github.com/chrisbinsunny/flippy/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

**Contributors**

<a href="https://github.com/chrisbinsunny/flippy/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=chrisbinsunny/flippy" />
</a>

