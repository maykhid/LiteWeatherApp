import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class GenerateIcon {
  static IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return WeatherIcons.thunderstorm;
    } else if (condition < 400) {
      return WeatherIcons.showers;
    } else if (condition < 600) {
      return WeatherIcons.rain;
    } else if (condition < 700) {
      return WeatherIcons.snow;
    } else if (condition < 800) {
      return WeatherIcons.day_haze;
    } else if (condition == 800) {
      return WeatherIcons.day_sunny;
    } else if (condition <= 804) {
      return WeatherIcons.cloudy;
    } else {
      return WeatherIcons.day_sunny;
    }
  }
}

class RoundOff {
  static stringToDouble(String num) {
    return '${double.parse(num).toStringAsFixed(0)} ℃';
  }
}

class DateFormatter {
  static String formatDate(DateTime time) {
    DateFormat formatter = DateFormat.yMMMMEEEEd();
    return formatter.format(time);
  }

  static String formatUnix(DateTime time) {
    // DateFormat formatter = DateFormat.yMMMMEEEEd();
    // return formatter.format(time);
    // var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    DateFormat formatter = DateFormat.EEEE();
    return formatter.format(time);
  }
}
