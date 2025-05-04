import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/mvvm/base/view_model.dart';

abstract class View<VM extends ViewModel> extends StatefulWidget {
  const View({super.key});

  VM create(BuildContext context);

  Widget buildView(BuildContext context, VM viewModel);

  @override
  State<View<VM>> createState() => _ViewState<VM>();
}

class _ViewState<VM extends ViewModel> extends State<View<VM>> {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.create(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return widget.buildView(context, viewModel);
      },
    );
  }
}
