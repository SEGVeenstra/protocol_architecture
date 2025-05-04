import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/protocols/counter_protocols.dart';

class CounterActionsBar extends StatelessWidget {
  const CounterActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => CounterProtocols.increment(context),
          child: Text('+'),
        ),
        ElevatedButton(
          onPressed: () => CounterProtocols.reset(context),
          child: Text('CE'),
        ),
        ElevatedButton(
          onPressed: () => CounterProtocols.decrement(context),
          child: Text('-'),
        ),
      ],
    );
  }
}
