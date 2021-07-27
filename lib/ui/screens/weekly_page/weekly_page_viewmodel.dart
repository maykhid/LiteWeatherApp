import 'package:lite_weather_app/core/data_models/weather_forecast_model.dart';
import 'package:lite_weather_app/core/use_case/client_use_case.dart';
import 'package:lite_weather_app/core/use_case/locator_use_case.dart';
import 'package:lite_weather_app/ui/screens/today_page/today_page_viewmodel.dart';

class WeeklyPageViewModel extends TodayPageViewModel {
  WeatherApiUseCaseImpl _weatherApiUseCaseImpl = WeatherApiUseCaseImpl();
  LocatorUseCase _locatorUseCase = LocatorUseCase();

  Future<WeatherForecastModel> requestWeatherForecastWithLocation() async {
    try {
      var position = await _locatorUseCase.getPosition();
      String lat = position.latitude.toString();
      String lon = position.longitude.toString();
      //
      var data =
          await _weatherApiUseCaseImpl.clientForecastWithLocation(lat, lon);
      print('This is forecast data${data.city}');
      return data;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
