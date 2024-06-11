// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';

class CustomAppBarWidget extends StatefulWidget {
  AnimationController animationController;
  Animation colorsTween, homeTween, yogaTween, iconTween, drawerTween;
  Function()? onPressed;

  CustomAppBarWidget({
    super.key,
    required this.animationController,
    required this.colorsTween,
    required this.drawerTween,
    required this.homeTween,
    required this.iconTween,
    required this.onPressed,
    required this.yogaTween,
  });

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height20 * 5,
      child: AnimatedBuilder(
        animation: widget.animationController,
        builder: (context, child) => AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: widget.drawerTween.value,
            ),
            onPressed: widget.onPressed,
          ),
          backgroundColor: widget.colorsTween.value,
          elevation: 0,
          title: Row(
            children: [
              Text(
                "YOGA ",
                style: TextStyle(
                  color: widget.homeTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font20,
                ),
              ),
              Text(
                "APP UI",
                style: TextStyle(
                  color: widget.yogaTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font20,
                ),
              )
            ],
          ),
          actions: [
            Icon(
              Icons.notifications,
              color: widget.iconTween.value,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
