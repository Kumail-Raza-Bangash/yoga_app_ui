import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app_ui/provider/workout_provider.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';
import 'package:yoga_app_ui/view/widgets/custom_button_widget.dart';
import 'package:yoga_app_ui/view/widgets/gradient_text_widget.dart';

class FinishingScreen extends StatelessWidget {
  const FinishingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WorkoutProvider>(
      create: (context) => WorkoutProvider(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _finishingImage(),
            ),
            Positioned(
              top: Dimensions.screenHeight / 2,
              left: -3,
              right: -3,
              bottom: -5,
              child: Consumer<WorkoutProvider>(
                builder: (context, myWorkoutProvider, child) {
                  return _finishingBody(myWorkoutProvider, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _finishingImage() {
    return Container(
      height: Dimensions.screenHeight / 1.9,
      width: Dimensions.screenWidth,
      padding: EdgeInsets.all(Dimensions.width30 * 2),
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
      ),
      child: Image.asset(
        "assets/images/congratulations_pic.png",
      ),
    );
  }

  Container _finishingBody(
      WorkoutProvider myWorkoutProvider, BuildContext context) {
    return Container(
      height: Dimensions.height30 * 15,
      width: Dimensions.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius30),
          topRight: Radius.circular(Dimensions.radius30),
        ),
        border: Border.all(color: AppColor.primaryColor, width: 2),
        color: AppColor.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Dimensions.width20),
                child: GradientTextWidget(
                  text: "GREAT!",
                  fontSize: Dimensions.font30,
                  gradientColor: AppColor.textGradientColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GradientTextWidget(
                        fontSize: Dimensions.font25,
                        text: "120",
                        gradientColor: AppColor.textGradientColor,
                      ),
                      GradientTextWidget(
                        fontSize: Dimensions.font15,
                        text: "kCal",
                        gradientColor: AppColor.textGradientColor,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GradientTextWidget(
                        fontSize: Dimensions.font25,
                        text: "26",
                        gradientColor: AppColor.textGradientColor,
                      ),
                      GradientTextWidget(
                        fontSize: Dimensions.font15,
                        text: "Minutes",
                        gradientColor: AppColor.textGradientColor,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width30,
              bottom: Dimensions.width10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                  onPressed: () {},
                  text: 'Rate Our APP',
                  fontSize: Dimensions.font15,
                  height: Dimensions.height45,
                  width: Dimensions.width30 * 7,
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.share,
                    color: AppColor.primaryColor,
                    size: Dimensions.iconSize20 * 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
