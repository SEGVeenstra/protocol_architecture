import 'package:flutter/material.dart';

typedef InitCallback = Future<void> Function(BuildContext context);

/// A widget that initializes a callback when it is created.
/// This is useful for loading data or performing setup tasks before
/// displaying the child widget.
class InitWidget extends StatefulWidget {
  const InitWidget({super.key, required this.init, required this.child});

  final Widget child;
  final InitCallback? init;

  @override
  State<InitWidget> createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
  @override
  void initState() {
    super.initState();
    widget.init?.call(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
