import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/protocols/counter_protocols.dart';
import 'package:protocol_architecture_test/state/counter_state.dart';
import 'package:protocol_architecture_test/ui/pages/multi_counter_page.dart';
import 'package:protocol_architecture_test/ui/utils/component_widget.dart';
import 'package:protocol_architecture_test/ui/widgets/counter_actions_bar.dart';
import 'package:protocol_architecture_test/ui/widgets/counter_display.dart';
import 'package:provider/provider.dart';

class CounterPage extends ComponentWidget<CounterState> {
  const CounterPage({super.key});

  @override
  Widget buildComponent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.widgets),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MultiCounterPage()),
                ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: CounterDisplay(
                  value: context.watch<CounterState>().value,
                ),
              ),
            ),
            CounterActionsBar(),
          ],
        ),
      ),
    );
  }

  @override
  CounterState stateBuilder(BuildContext context) => CounterState();

  @override
  Future<void> onCreate(BuildContext context) async {
    await CounterProtocols.load(context);
  }
}
