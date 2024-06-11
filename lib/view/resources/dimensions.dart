// First get the FlutterView.
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// // Dimensions in physical pixels (px)
// Size size = view.physicalSize;
// double width = size.width;
// double height = size.height;

// Dimensions in logical pixels (dp)
Size size = view.physicalSize / view.devicePixelRatio;
double width = size.width;
double height = size.height;

class Dimensions {
  static double screenHeight = height; //My OPPO f17 height is 925
  static double screenWidth = width; //My OPPO f17 width is 421

  //dynamic height for passing and margin
  static double height05 = screenHeight / 90.00; // 925/5
  static double height10 = screenHeight / 90.00; // 925/10
  static double height20 = screenHeight / 45.00; // 925/20
  static double height30 = screenHeight / 30.00; // 925/30
  static double height45 = screenHeight / 20.00; // 925/45

  //dynamic width for passing and margin
  static double width05 = screenWidth / 85.00; // 421/5
  static double width10 = screenWidth / 40.00; // 421/10
  static double width20 = screenWidth / 20.00; // 421/20
  static double width30 = screenWidth / 15.00; // 421/30
  static double width45 = screenWidth / 10.00; // 421/45

  // font size
  static double font15 = screenHeight / 60.00; // 925/16
  static double font20 = screenHeight / 45.00; // 925/20
  static double font25 = screenHeight / 37.50; // 925/26
  static double font30 = screenHeight / 30.00; // 925/20

  // radius
  static double radius05 = screenHeight / 180.00; // 925/5
  static double radius10 = screenHeight / 90.00; // 925/10
  static double radius15 = screenHeight / 60.00; // 925/15
  static double radius20 = screenHeight / 45.00; // 925/20
  static double radius30 = screenHeight / 30.00; // 925/30

  //icons Sizes
  static double iconSize10 = screenHeight / 90.00; // 925/10
  static double iconSize15 = screenHeight / 60.00; // 925/15
  static double iconSize20 = screenHeight / 50.00; // 925/20
  static double iconSize25 = screenHeight / 40.00; // 925/24
}
