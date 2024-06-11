import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app_ui/provider/splash_screen_provider.dart'; // Updated import
import 'package:yoga_app_ui/view/resources/colors.dart';
import 'package:yoga_app_ui/view/resources/dimensions.dart';
import 'package:yoga_app_ui/view/screens/home_screen.dart';
import 'package:yoga_app_ui/view/widgets/gradient_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Navigate to HomeScreen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashScreenProvider>(
      create: (context) => SplashScreenProvider(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: Dimensions.height30 * 8,
                    width: Dimensions.height30 * 8,
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
                      image: const DecorationImage(
                        image: AssetImage('assets/images/yoga_icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height30),
              ScaleTransition(
                scale: _animation,
                child: GradientTextWidget(
                  text: "YOGA APP",
                  fontSize: Dimensions.font30,
                  gradientColor: AppColor.textGradientColor,
                ),
              ),
              SizedBox(height: Dimensions.height30),
            ],
          ),
        ),
      ),
    );
  }
}
