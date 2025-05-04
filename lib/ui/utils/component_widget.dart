import 'dart:async';

import 'package:flutter/material.dart';
import 'package:protocol_architecture_test/ui/utils/init_widget.dart';
import 'package:provider/provider.dart';

abstract class ComponentWidget<T extends ChangeNotifier>
    extends StatelessWidget {
  const ComponentWidget({super.key});

  /// Creates a [ChangeNotifier] instance for the component.
  T stateBuilder(BuildContext context);

  /// Called when the component is created.
  FutureOr<void> onCreate(BuildContext context) {}

  /// Builds the component's UI.
  Widget buildComponent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => stateBuilder(context),
      builder:
          (context, _) =>
              InitWidget(init: onCreate, child: buildComponent(context)),
    );
  }
}
