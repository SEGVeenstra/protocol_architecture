import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/mvvm/base/view.dart' as mvvm;
import 'package:protocol_architecture_test/mvvm/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterView extends mvvm.View<CounterViewModel> {
  const CounterView({super.key});

  @override
  CounterViewModel create(context) => CounterViewModel(context.read());

  @override
  Widget buildView(BuildContext context, CounterViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            IconButton.filled(
              onPressed: viewModel.increment,
              icon: Icon(Icons.add),
            ),
            Text(
              '${viewModel.state.count}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            IconButton.filledTonal(
              onPressed: viewModel.clear,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
