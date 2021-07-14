import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lite_weather_app/core/data/location/locator.dart';

class LocatorUseCase {
  Locator _locator = Locator();

  Future<Either<String, Position>> getPosition() async {
    // _locator.determinePosition();

    try {
      var data = await _locator.determinePosition();
      return Right(data);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
