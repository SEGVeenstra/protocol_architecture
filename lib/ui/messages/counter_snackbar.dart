import 'package:flutter/material.dart';

class CounterSnackbar {
  const CounterSnackbar._();

  static Future<void> show(
    BuildContext context, {
    required String message,
    String? actionLabel,
    required VoidCallback? onPressed,
  }) async {
    assert(
      onPressed != null && actionLabel != null ||
          onPressed == null && actionLabel == null,
      'Either both actionLabel and onPressed should be provided, or neither.',
    );
    final content = _CounterSnackbarContent(message: message);
    final snackbar = SnackBar(
      content: content,
      action:
          onPressed != null
              ? SnackBarAction(label: actionLabel!, onPressed: onPressed)
              : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

class _CounterSnackbarContent extends StatelessWidget {
  const _CounterSnackbarContent({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
