import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/mvvm/counter_view.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterView());
  }
}
