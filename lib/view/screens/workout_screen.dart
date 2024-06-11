import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app_ui/provider/workout_provider.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';
import 'package:yoga_app_ui/view/screens/finishing_screen.dart';
import 'package:yoga_app_ui/view/widgets/custom_button_widget.dart';
import 'package:yoga_app_ui/view/widgets/gradient_text_widget.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

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
              child: _workoutImage(),
            ),
            Positioned(
              top: Dimensions.screenHeight / 2,
              left: 0,
              right: 0,
              child: Consumer<WorkoutProvider>(
                builder: (context, myWorkoutProvider, child) {
                  return _workoutBody(myWorkoutProvider, context);
                },
              ),
            ),
            Positioned(
              bottom: -10,
              left: -5,
              right: -5,
              child: Consumer<WorkoutProvider>(
                builder: (context, myWorkoutProvider, child) {
                  return _bottomNavigationBar(myWorkoutProvider, context);
                },
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Consumer<WorkoutProvider>(
                builder: (context, myWorkoutProvider, child) {
                  return _visibility(myWorkoutProvider, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Visibility _visibility(
      WorkoutProvider myWorkoutProvider, BuildContext context) {
    return Visibility(
      visible: myWorkoutProvider.visible,
      child: Container(
        color: AppColor.backgroundColor.withOpacity(0.95),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientTextWidget(
              fontSize: Dimensions.font15 * 3,
              text: 'Pause',
              gradientColor: AppColor.textGradientColor,
            ),
            GradientTextWidget(
              fontSize: Dimensions.font15,
              text: 'Yoga feels better',
              gradientColor: AppColor.textGradientColor,
            ),
            SizedBox(height: Dimensions.height45),
            CustomButtonWidget(
              onPressed: () {
                myWorkoutProvider.hideVisibility();
              },
              text: "Restart",
              fontSize: Dimensions.font20,
              height: 40,
              width: 250,
            ),
            SizedBox(height: Dimensions.height05),
            CustomButtonWidget(
              onPressed: () {
                myWorkoutProvider.hideVisibility();
                myWorkoutProvider.restartWorkout();
              },
              text: "Quit",
              fontSize: Dimensions.font20,
              height: 40,
              width: 250,
            ),
            SizedBox(height: Dimensions.height05),
            CustomButtonWidget(
              onPressed: () {
                myWorkoutProvider.hideVisibility();
              },
              text: "RESUME",
              fontSize: Dimensions.font20,
              height: 40,
              width: 250,
            ),
            SizedBox(height: Dimensions.height05),
          ],
        ),
      ),
    );
  }

  Container _workoutImage() {
    return Container(
      height: Dimensions.height30 * 16,
      width: Dimensions.screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80",
          ),
        ),
      ),
    );
  }

  Container _workoutBody(
      WorkoutProvider myWorkoutProvider, BuildContext context) {
    return Container(
      height: Dimensions.height30 * 15,
      width: Dimensions.screenWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColor.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Dimensions.height20 * 4),
          GradientTextWidget(
            text: "YOGA EXCERCISE",
            fontSize: Dimensions.font30,
            gradientColor: AppColor.textGradientColor,
          ),
          SizedBox(height: Dimensions.height20),
          GestureDetector(
            onTap: () {
              myWorkoutProvider.restartWorkout();
            },
            child: Container(
              height: Dimensions.height30 * 6,
              width: Dimensions.height30 * 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30 * 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primaryColor.withOpacity(0.15),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(
                  color: AppColor.primaryColor,
                  width: 3,
                ),
              ),
              child: Center(
                child: GradientTextWidget(
                  text: myWorkoutProvider.countdown == 0
                      ? "RESTART"
                      : myWorkoutProvider.countdown.toString(),
                  fontSize: Dimensions.font30,
                  gradientColor: AppColor.textGradientColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _bottomNavigationBar(
      WorkoutProvider myWorkoutProvider, BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(Dimensions.width10),
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
        top: Dimensions.width10,
        bottom: Dimensions.width20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius30 * 3),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButtonWidget(
            onPressed: () {
              myWorkoutProvider.showVisibility();
            },
            text: "Previous",
            fontSize: Dimensions.font15,
            height: 35,
            width: 100,
          ),
          CustomButtonWidget(
            onPressed: () {
              myWorkoutProvider.showVisibility();
            },
            text: "Pause",
            fontSize: Dimensions.font15,
            height: 35,
            width: 100,
          ),
          CustomButtonWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FinishingScreen(),
                ),
              );
            },
            text: "Next",
            fontSize: Dimensions.font15,
            height: 35,
            width: 100,
          ),
        ],
      ),
    );
  }
}
