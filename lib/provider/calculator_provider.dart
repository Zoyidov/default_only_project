import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  num answer = 0;

  CalculatorProvider();

  getAnswer() => answer;

  void add(int a, int b) {
    answer = a + b;
    notifyListeners();
  }

  void subtraction(int a, int b) {
    answer = a - b;
    notifyListeners();
  }

  void multiplication(int a, int b) {
    answer = a * b;
    notifyListeners();
  }

  void division(int a, int b) {
    answer = a / b;
    notifyListeners();
  }

  void middleArithmetic(int a, int b) {
    answer = (a + b) / 2;
    notifyListeners();
  }

  void mediumGeometric(int a, int b) {
    answer = sqrt(a * b);
    notifyListeners();
  }
}
