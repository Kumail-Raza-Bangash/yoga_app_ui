import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreenProvider extends ChangeNotifier {
  int _countdown = 5;
  int get countdown => _countdown;

  SplashScreenProvider() {
    _startCountdown();
  }

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 1) {
        timer.cancel();
      } else {
        _countdown--;
        notifyListeners();
      }
    });
  }
}
