import 'package:lite_weather_app/app/base_app/base_viewmodel.dart';
import 'package:lite_weather_app/core/data_models/weather_data_model.dart';
import 'package:lite_weather_app/core/use_case/client_use_case.dart';
import 'package:lite_weather_app/core/use_case/locator_use_case.dart';

class TodayPageViewModel extends BaseViewModel {
  WeatherApiUseCaseImpl _weatherApiUseCaseImpl = WeatherApiUseCaseImpl();
  LocatorUseCase _locatorUseCase = LocatorUseCase();

  Future<WeatherDataModel> requestWeatherDataWithLoacation() async {
    try {
      var position = await _locatorUseCase.getPosition();
      String lat = position.latitude.toString();
      String lon = position.longitude.toString();
      //
      var data = await _weatherApiUseCaseImpl.clientWithLocation(lat, lon);
      // print('This is ${data.name}');
      return data;
    } catch (e) {
      // print(e);
      // throw Exception(e);
      rethrow;
    }
  }

  // Future<WeatherDataModel> requestResult() => requestWeatherDataWithLoacation();

  void requestWeatherDataWithCity() {}
}
