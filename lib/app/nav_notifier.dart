import 'package:flutter/material.dart';

class NavigationNotifier with ChangeNotifier {
  bool _didRouteChange = false;

  bool get didRouteChange => _didRouteChange;

  updateRouteChange(bool didRouteChange) {
    _didRouteChange = didRouteChange;
    print('Route has changed value is $_didRouteChange');
    notifyListeners();
  }
}
