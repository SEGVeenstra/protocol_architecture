import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/protocols/counter_protocols.dart';
import 'package:protocol_architecture_test/state/counter/counter_state.dart';
import 'package:protocol_architecture_test/ui/widgets/counter_actions_bar.dart';
import 'package:protocol_architecture_test/ui/widgets/counter_display.dart';
import 'package:protocol_architecture_test/ui/widgets/init_widget.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterState(),
      builder: (context, _) {
        return InitWidget(
          init: (context) => CounterProtocols.load(context),
          child: Scaffold(
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
          ),
        );
      },
    );
  }
}
