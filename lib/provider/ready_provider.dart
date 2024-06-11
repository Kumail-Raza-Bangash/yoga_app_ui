import 'dart:async';
import 'package:flutter/material.dart';

class ReadyProvider with ChangeNotifier {
  Timer? _timer;
  int countdown = 3;

  ReadyProvider() {
    myTimerSec();
  }

  myTimerSec() {
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
