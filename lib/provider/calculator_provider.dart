import 'package:flutter/material.dart';
import '../core/string_calculator.dart';

class CalculatorProvider extends ChangeNotifier {
  String _result = '';
  String _error = "";

  String get result => _result;
  String get error => _error;
  void calculate(String input) {
    _result = '';
    _error = '';

    try {
      final sum = add(input);
      _result = 'Result: $sum';
    } catch (e) {
      _error = e.toString();
    }

    notifyListeners();
  }

  void clear() {
    _result = '';
    _error = '';
    notifyListeners();
  }
}
