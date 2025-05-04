import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentWidget extends StatefulWidget {
  const ComponentWidget({
    super.key,
    required this.builder,
    this.init,
    required this.create,
  });
  final ChangeNotifier Function() create;
  final WidgetBuilder builder;
  final Future<void> Function(BuildContext context)? init;

  @override
  State<ComponentWidget> createState() => _ComponentWidgetState();
}

class _ComponentWidgetState extends State<ComponentWidget> {
  @override
  void initState() {
    super.initState();
    widget.init?.call(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget.create(),
      child: widget.builder(context),
    );
  }
}
