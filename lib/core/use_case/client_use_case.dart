import 'package:dartz/dartz.dart';
import 'package:lite_weather_app/core/data/remote/api/api.dart';
import 'package:lite_weather_app/core/data_models/weather_data_model.dart';
import 'package:lite_weather_app/core/data_models/weather_forecast_model.dart';

abstract class WeatherApiUseCase {
  Future<WeatherDataModel> clientWithLocation(lat, lon);
  Future<Either<String, WeatherDataModel>> clientWithCityName(String city);
  Future<WeatherForecastModel> clientForecastWithLocation(lat, lon);
}

class WeatherApiUseCaseImpl extends WeatherApiUseCase {
  final WeatherRemoteDataSourceImpl _weatherRemoteDataSourceImpl =
      WeatherRemoteDataSourceImpl();

  @override
  Future<WeatherDataModel> clientWithLocation(lat, lon) async {
    //
    try {
      var data = await _weatherRemoteDataSourceImpl.processClientWithLocation(
        lat,
        lon,
      );
      print(data.body);

      return WeatherDataModel.fromJson(data.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<String, WeatherDataModel>> clientWithCityName(
      String city) async {
    //
    try {
      var data =
          await _weatherRemoteDataSourceImpl.processClientWithCityName(city);
      return Right(WeatherDataModel.fromJson(data.body));
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<WeatherForecastModel> clientForecastWithLocation(lat, lon) async {
    try {
      var data = await _weatherRemoteDataSourceImpl
          .processClientForecastWithLocation(lat, lon);
      print(data.body);

      return WeatherForecastModel.fromJson(data.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
