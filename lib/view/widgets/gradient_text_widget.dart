import 'package:flutter/material.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';

// ignore: must_be_immutable
class GradientTextWidget extends StatelessWidget {
  double fontSize;
  final String text;
  final LinearGradient gradientColor;

  GradientTextWidget({
    super.key,
    required this.fontSize,
    required this.text,
    required this.gradientColor,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradientColor.createShader(bounds);
      },
      child: Text(
        text,
        //textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
}
