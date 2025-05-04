import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/state/counter/counter_state.dart';
import 'package:protocol_architecture_test/ui/pages/counter_page.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<CounterState>(
        create: (context) => CounterState(),
        child: CounterPage(),
      ),
    );
  }
}
