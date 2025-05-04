import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/state/counter/counter_state.dart';
import 'package:protocol_architecture_test/ui/utils/component_widget.dart';
import 'package:protocol_architecture_test/ui/widgets/counter_actions_bar.dart';
import 'package:protocol_architecture_test/ui/widgets/counter_display.dart';
import 'package:provider/provider.dart';

class MultiCounterPage extends ComponentWidget<CounterState> {
  const MultiCounterPage({super.key});

  @override
  Widget buildComponent(BuildContext context) {
    final counterState = context.watch<CounterState>();
    return Scaffold(
      appBar: AppBar(title: Text('Multi Counter')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(32.0),
                children: [
                  CounterDisplay(value: counterState.value),
                  CounterDisplay(value: counterState.value),
                  CounterDisplay(value: counterState.value),
                  CounterDisplay(value: counterState.value),
                ],
              ),
            ),
            CounterActionsBar(),
            CounterActionsBar(),
          ],
        ),
      ),
    );
  }

  @override
  CounterState stateBuilder(BuildContext context) => CounterState();
}
