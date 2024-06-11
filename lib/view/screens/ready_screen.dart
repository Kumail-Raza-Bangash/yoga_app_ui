import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app_ui/provider/ready_provider.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';
import 'package:yoga_app_ui/view/screens/workout_screen.dart';
import 'package:yoga_app_ui/view/widgets/gradient_text_widget.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReadyProvider>(
      create: (context) => ReadyProvider(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientTextWidget(
                text: "ARE YOU READY?",
                fontSize: Dimensions.font30,
                gradientColor: AppColor.textGradientColor,
              ),
              SizedBox(height: Dimensions.height30),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WorkoutScreen(),
                    ),
                  );
                },
                child: Container(
                  height: Dimensions.height30 * 6,
                  width: Dimensions.height30 * 6,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius30 * 3),
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
                  child: Consumer<ReadyProvider>(
                    builder: (context, myReadyProvider, child) {
                      return Center(
                        child: GradientTextWidget(
                          text: myReadyProvider.countdown == 0
                              ? "START"
                              : myReadyProvider.countdown.toString(),
                          fontSize: Dimensions.font20 * 2,
                          gradientColor: AppColor.textGradientColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
