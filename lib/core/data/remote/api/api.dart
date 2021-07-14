import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lite_weather_app/core/data/remote/api/api_client_resources.dart';

abstract class WeatherRemoteDataSource {
  Future<http.Response> processClientWithLocation(String lat, String lon);
  Future<http.Response> processClientWithCityName(String city);

  //TODO: client for weeklyforecast for both location and city
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  ApiClientResources _apiClientResources = ApiClientResources();
  @override
  Future<http.Response> processClientWithCityName(String city) async {
    late final http.Response response;

    try {
      response = await http.get(
        Uri.https(
          _apiClientResources.baseUrl,
          _apiClientResources.weatherPath,
          _apiClientResources.clientParamsCityname(city),
        ),
        headers: <String, String>{
          'Accept': 'application/json',
        },
      );

      return response;
    } catch (e) {
      String message = "An error occured";
      message = json.decode(response.body)['message'];
      throw Exception(message);
    }
  }

  @override
  Future<http.Response> processClientWithLocation(
      String lat, String lon) async {
    late final http.Response response;

    try {
      response = await http.get(
        Uri.https(
          _apiClientResources.baseUrl,
          _apiClientResources.weatherPath,
          _apiClientResources.clientParamsLocation(lat, lon),
        ),
        headers: <String, String>{
          'Accept': 'application/json',
        },
      );

      return response;
    } catch (e) {
      String message = "An error occured";
      message = json.decode(response.body)['message'];
      throw Exception(message);
    }
  }
}