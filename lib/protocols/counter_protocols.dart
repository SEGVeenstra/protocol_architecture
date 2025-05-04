import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/repositories/counter_repository.dart';
import 'package:protocol_architecture_test/state/counter_state.dart';
import 'package:protocol_architecture_test/ui/messages/counter_snackbar.dart';
import 'package:provider/provider.dart';

abstract class CounterProtocols {
  static Future<void> load(BuildContext context) async {
    final counterState = context.read<CounterState>();
    final counterRepository = context.read<CounterRepository>();

    final counterValue = await counterRepository.getCounter();
    counterState.value = counterValue;
  }

  static Future<void> set(BuildContext context, int count) async {
    final counterState = context.read<CounterState>();
    final counterRepository = context.read<CounterRepository>();

    await counterRepository.saveCounter(count);
    counterState.value = count;
  }

  static Future<void> increment(BuildContext context) async {
    final counterState = context.read<CounterState>();
    final counterRepository = context.read<CounterRepository>();

    await counterRepository.saveCounter(++counterState.value);
  }

  static Future<void> decrement(BuildContext context) async {
    final counterState = context.read<CounterState>();
    final counterRepository = context.read<CounterRepository>();

    await counterRepository.saveCounter(--counterState.value);
  }

  static Future<void> reset(BuildContext context) async {
    final counterState = context.read<CounterState>();
    final counterRepository = context.read<CounterRepository>();

    final oldValue = counterState.value;

    await counterRepository.saveCounter(counterState.value = 0);

    if (!context.mounted) return;

    await CounterSnackbar.show(
      context,
      message: 'Counter has been reset',
      onPressed: () => CounterProtocols.set(context, oldValue),
      actionLabel: 'Undo',
    );
  }
}
