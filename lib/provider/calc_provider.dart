import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  num result = 0;

  CalculatorProvider();

  getAnswer() => result;

  void add(int a, int b) {
    result = a + b;
    notifyListeners();
  }

  void subtraction(int a, int b) {
    result = a - b;
    notifyListeners();
  }

  void multiplication(int a, int b) {
    result = a * b;
    notifyListeners();
  }

  void division(int a, int b) {
    result = a / b;
    notifyListeners();
  }

  void middleArithmetic(int a, int b) {
    result = (a + b) / 2;
    notifyListeners();
  }

  void mediumGeometric(int a, int b) {
    result = sqrt(a * b);
    notifyListeners();
  }
  void reset(){
    result = 0;
    notifyListeners();
  }
}
