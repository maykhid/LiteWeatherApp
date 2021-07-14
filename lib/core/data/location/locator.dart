import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Locator with ChangeNotifier {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  ///
  bool _serviceEnabled = false;
  String _message = "No message";

  bool get serviceEnabled => _serviceEnabled;
  String get message => _message;

  changeMessage(String message) {
    _message = message;
    notifyListeners();
  }

  changeServiceEnabledStatus(bool serviceEnabled) {
    _serviceEnabled = serviceEnabled;
    notifyListeners();
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;

    // Test if location services are enabled.
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      changeMessage('Location services are disabled.');
      print(_message);
      throw Exception(_message);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        changeMessage('Location permissions are denied');
        print(_message);
        throw Exception(_message);
        // return Future.error(');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      changeMessage(
          'Location permissions are permanently denied, we cannot request permissions.');
      print(_message);
      throw Exception(_message);
      // return Future.error(
      //     ');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    changeServiceEnabledStatus(true);
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
  }
}
