
# Flipper 🎡

Get ready to flip your widgets like never before!   Introducing Flipper - an interactive flipper widget for Flutter. Flipper is built to be highly customizable, easy to use and provides an intuitive way to flip between two sides of a card.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

To start using Flipper, you need to add the package to your pubspec.yaml file:

```yaml  
dependencies:  
   ...
   flipper: 0.4
```  
Import it:
```dart  
import 'package:flipper/flipper.dart';
```  

## Usage

### Draggable Flipper
To use the Draggable Flipper, you need to wrap the widgets that you want to flip with `DragFlipper` widget.

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

## Additional information

TODO: Tell users more about the package: where to find more information, how to  
contribute to the package, how to file issues, what response they can expect  
from the package authors, and more.