import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app_ui/provider/ready_provider.dart';
import 'package:yoga_app_ui/provider/splash_screen_provider.dart';
import 'package:yoga_app_ui/provider/workout_provider.dart';
import 'package:yoga_app_ui/view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReadyProvider()),
        ChangeNotifierProvider(create: (context) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter Custom Appbar',
        home: SplashScreen(),
      ),
    );
  }
}
