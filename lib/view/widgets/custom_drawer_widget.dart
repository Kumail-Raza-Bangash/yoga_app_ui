import 'package:flutter/material.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';
import 'package:yoga_app_ui/view/widgets/gradient_text_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: Dimensions.height30 * 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1545389336-cf090694435e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height45),
              const IconAndText(
                text: 'Reset Progress',
                icon: Icons.refresh,
              ),
              SizedBox(height: Dimensions.height20),
              const IconAndText(
                text: 'Share With Friends',
                icon: Icons.share,
              ),
              SizedBox(height: Dimensions.height20),
              const IconAndText(
                text: 'Rate Us',
                icon: Icons.star,
              ),
              SizedBox(height: Dimensions.height20),
              const IconAndText(
                text: 'Feedback',
                icon: Icons.comment,
              ),
              SizedBox(height: Dimensions.height20),
              const IconAndText(
                text: 'Privacy Policy',
                icon: Icons.security,
              ),
            ],
          ),
          GradientTextWidget(
            text: "Version 1.0.0",
            gradientColor: AppColor.textGradientWhiteColor,
            fontSize: Dimensions.font15 - 3,
          ),
        ],
      ),
    );
  }
}

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconAndText({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: Dimensions.width20),
        Icon(
          icon,
          size: Dimensions.iconSize25,
          color: AppColor.whiteColor,
        ),
        SizedBox(width: Dimensions.width20),
        GradientTextWidget(
          text: text,
          gradientColor: AppColor.textGradientWhiteColor,
          fontSize: Dimensions.font15,
        ),
      ],
    );
  }
}
