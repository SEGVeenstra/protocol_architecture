import 'package:flutter/material.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({super.key, required this.init, required this.child});

  final void Function(BuildContext context) init;
  final Widget child;

  @override
  State<InitWidget> createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
  @override
  void initState() {
    super.initState();
    widget.init.call(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
