class ApiClientResources {
  String baseUrl = "api.openweathermap.org";
  String forecastPath = "/data/2.5/forecast";
  String weatherPath = "/data/2.5/weather";
  String appid = "57a2bf92a3ed99fd39cea5908da60a66";

  clientParamsCityname(String city) {
    return {
      "q": city,
      "units": "metric",
      "appid": appid, // Note to Dev: This is not supposed to be here
    };
  }

  clientParamsLocation(String lat, String lon) {
    return {
      "lat": lat,
      "lon": lon,
      "units": "metric",
      "appid": appid, // Note to Dev: This is not supposed to be here
    };
  }
}
