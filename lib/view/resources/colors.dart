import 'package:flutter/material.dart';

class AppColor {
  static const Color blackColor = Color(0xFF17202A);
  static const Color lightBlackColor = Color(0xFF34495E);
  static const Color whiteColor = Color(0xFFFDFEFE);
  static const Color greyColor = Color(0xFF839192);
  static const Color redColor = Color(0xFFE74C3C);

  static const Color primaryColor = Color(0xFF8E44AD);
  static const Color secondaryColor = Color(0xFFD2B4DE);

  static const Color backgroundColor = Color(0xFFE8DAEF);

  static const Color transparentColor = Colors.transparent;

  // Gradient Color for background
  static const LinearGradient gradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor,
      secondaryColor,
      primaryColor,
    ],
  );

  // Gradient Color for background
  static const LinearGradient textGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor,
      primaryColor,
      primaryColor,
    ],
  );

  // Gradient White Color for background
  static const LinearGradient textGradientWhiteColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      whiteColor,
      whiteColor,
      whiteColor,
    ],
  );

  // Gradient Black Color for background
  static const LinearGradient textGradientBlackColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      blackColor,
      blackColor,
      blackColor,
    ],
  );
}
