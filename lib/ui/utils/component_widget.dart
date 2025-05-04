import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ComponentWidget extends StatefulWidget {
  const ComponentWidget({super.key});

  /// Creates a [ChangeNotifier] instance for the component.
  ChangeNotifier stateBuilder(BuildContext context);

  /// Called when the component is created.
  void onCreate(BuildContext context) {}

  /// Builds the component's UI.
  Widget buildComponent(BuildContext context);

  @override
  State<ComponentWidget> createState() => _ComponentWidgetState();
}

class _ComponentWidgetState extends State<ComponentWidget> {
  @override
  void initState() {
    super.initState();
    widget.onCreate.call(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget.stateBuilder(context),
      builder: (context, _) => widget.buildComponent(context),
    );
  }
}
