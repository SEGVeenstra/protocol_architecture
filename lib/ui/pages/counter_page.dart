import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/protocols/counter_protocols.dart';
import 'package:protocol_architecture_test/state/counter/counter_state.dart';
import 'package:protocol_architecture_test/ui/utils/component_widget.dart';
import 'package:protocol_architecture_test/ui/widgets/counter_actions_bar.dart';
import 'package:protocol_architecture_test/ui/widgets/counter_display.dart';
import 'package:provider/provider.dart';

class CounterPage extends ComponentWidget {
  const CounterPage({super.key});

  @override
  Widget buildComponent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
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
  ChangeNotifier stateBuilder(BuildContext context) {
    return CounterState();
  }

  @override
  Future<void> onCreate(BuildContext context) async {
    await CounterProtocols.load(context);
  }
}
