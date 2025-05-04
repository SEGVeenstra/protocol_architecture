import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class ViewModel<T> with ChangeNotifier {
  ViewModel(this._state) {
    Future.delayed(Duration.zero, init);
  }

  T _state;

  T get state => _state!;

  FutureOr<void> init() async {
    // no-op
  }

  @protected
  void setState(T state) {
    _state = state;
    notifyListeners();
  }
}
