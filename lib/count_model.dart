import 'dart:math';

import 'package:flutter/material.dart';

class CountModel extends ChangeNotifier {
  int counter = 0;
  Color color = Colors.black;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void updateColor() {
    color = Color(
      (Random().nextDouble() * 0xFFFFFF).toInt() << 0,
    ).withOpacity(1.0);
  }
}
