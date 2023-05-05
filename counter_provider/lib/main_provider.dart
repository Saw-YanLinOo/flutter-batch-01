import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  // State
  int count = 1;

  increment() {
    count++;
    notifyListeners();
  }

  decrement() {
    count--;
    notifyListeners();
  }
}
