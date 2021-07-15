import 'package:geolocator/geolocator.dart';
import 'package:lite_weather_app/core/data/location/locator.dart';

class LocatorUseCase {
  Locator _locator = Locator();

  Future<Position> getPosition() async {
    // _locator.determinePosition();

    try {
      var data = await _locator.determinePosition();
      return data;
    } on Exception catch (e) {
      print(e);
      throw e;
    }
  }
}
