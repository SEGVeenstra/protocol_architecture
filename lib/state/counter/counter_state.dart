import 'package:flutter/material.dart';

class CounterState with ChangeNotifier {
  int _value = 0;
  int get value => _value;

  set value(int newValue) {
    _value = newValue;
    notifyListeners();
  }
}
