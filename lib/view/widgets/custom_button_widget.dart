import 'package:flutter/material.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize, height, width;

  const CustomButtonWidget({
    super.key, // Use Key? here
    required this.onPressed,
    required this.text,
    required this.fontSize,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColor.transparentColor,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          border: Border.all(
            color: AppColor.primaryColor,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
