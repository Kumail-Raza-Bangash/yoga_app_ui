import 'package:flutter/material.dart';
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';
import 'package:yoga_app_ui/view/screens/detail_screen.dart';
import 'package:yoga_app_ui/view/widgets/gradient_text_widget.dart';

// ignore: must_be_immutable
class TextCardWidget extends StatefulWidget {
  final String text1, text2, imgPath;

  const TextCardWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.imgPath,
  });

  @override
  State<TextCardWidget> createState() => _TextCardWidgetState();
}

class _TextCardWidgetState extends State<TextCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            widget.imgPath,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                text1: widget.text1,
                text2: widget.text2,
                imgPath: widget.imgPath,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: Dimensions.height30 * 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColor.blackColor.withOpacity(0.3),
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: GradientTextWidget(
                text: widget.text1,
                fontSize: Dimensions.font15,
                gradientColor: AppColor.textGradientWhiteColor,
              ),
            ),
            Positioned(
              left: 17,
              top: 35,
              child: GradientTextWidget(
                text: widget.text2,
                fontSize: Dimensions.font15 - 5,
                gradientColor: AppColor.textGradientWhiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
