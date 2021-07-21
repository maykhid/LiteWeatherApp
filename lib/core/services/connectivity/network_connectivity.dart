import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NetworkConnectivity with ChangeNotifier {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  String _message() {
    if (_connectionStatus == ConnectivityResult.none) {
      return "No network connection";
    }
    return "Network availabale";
  }

  String get message => _message();
  
  ConnectivityResult get status => _connectionStatus;

  NetworkConnectivity.instance(this._connectivity) {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    print(
        'NetworkConnectivity.instance just ran, connectionStatus $_connectionStatus');
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // check connection status and sends result to _updateConnectionStatus
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      print('InitConnectivity just ran and Connectivity is: $result');
      // updateConnectionStatus(result);
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }

    return _updateConnectionStatus(result);
  }

  // performs actions based on connecctivity result
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    notifyListeners();

    // if (_connectionStatus == ConnectivityResult.none) {
    //   // do something on connectivity off
    //   // print('No connections');
    //   message();
    // } else {
    //   // do something else
    //   // print('Connection avalable');
    //   message();
    // }
    print(_message());
  }
}
