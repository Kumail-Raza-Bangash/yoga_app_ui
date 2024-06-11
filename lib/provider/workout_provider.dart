import 'dart:async';
import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  Timer? _timer;
  int countdown = 30;
  bool visible = false;

  WorkoutProvider() {
    startWorkout();
  }

  void startWorkout() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        countdown--;
        notifyListeners();
        if (countdown == 0) {
          timer.cancel();
        }
      },
    );
  }

  void restartWorkout() {
    countdown = 31;
    startWorkout();
  }

  void showVisibility() {
    visible = true;
    notifyListeners();
  }

  void hideVisibility() {
    visible = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
