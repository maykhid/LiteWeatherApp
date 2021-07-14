import 'package:flutter/material.dart';

enum ViewState {
  Idle,
  Busy,
}

class BaseViewModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void changeState(ViewState newState) {
    _state = newState;
    notifyListeners();
    print(_state);
  }

  bool isBusy() => (_state == ViewState.Busy);
}
