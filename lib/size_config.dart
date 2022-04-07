import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth = 0;
  static double? screenHeight = 0;
  static double? defaultSize = 0;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
  }
}

// Get the proportionate height as per screen size
// Menggunakan null aware operator
// https://dart.dev/codelabs/dart-cheatsheet#null-aware-operators
// https://dart.dev/guides/language/language-tour#conditional-expressions
// https://flutterigniter.com/checking-null-aware-operators-dart/
double? getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight ?? 0;
  // 896 is the layout height that designer use
  // or you can say iPhone 11
  return (inputHeight / 896.0) * screenHeight;
}

// Get the proportionate height as per screen size
// Menggunakan null aware operator
// https://dart.dev/codelabs/dart-cheatsheet#null-aware-operators
// https://dart.dev/guides/language/language-tour#conditional-expressions
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth ?? 0;
  // 414 is the layout width that designer use
  return (inputWidth / 414.0) * screenWidth;
}
