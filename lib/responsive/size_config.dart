import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {

    _mediaQueryData = MediaQuery.of(context);
    print("screenWidth============${_mediaQueryData!.size.width}");
    print("screenH============${_mediaQueryData!.size.height}");

    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

    // print("blockSizeHorizontal==============$blockSizeHorizontal");
    // print("blockSizeVertical==============$blockSizeVertical");
  }
}