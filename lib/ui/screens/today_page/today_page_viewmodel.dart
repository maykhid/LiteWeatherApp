import 'package:geolocator/geolocator.dart';
import 'package:lite_weather_app/app/base_app/base_viewmodel.dart';
import 'package:lite_weather_app/core/use_case/client_use_case.dart';
import 'package:lite_weather_app/core/use_case/locator_use_case.dart';

class TodayPageViewModel extends BaseViewModel {
  WeatherApiUseCaseImpl _weatherApiUseCaseImpl = WeatherApiUseCaseImpl();
  LocatorUseCase locatorUseCase = LocatorUseCase();

  void requestWeatherDataWithLoacation() async {
    
    late String lat, lon;
    
    var position = await locatorUseCase.getPosition();
    position.fold((err) {
      // display error
    }, (position) async {
      // set position
      lat = position.latitude.toString();
      lon = position.longitude.toString();
      var response = await _weatherApiUseCaseImpl.clientWithLocation(lat, lon);
      response.fold((err) {
        // display error
      }, (response) {
        print("this is response name: ${response.name}");
        return response;
      });
    });
  }

  void requestWeatherDataWithCity() {}
}
