import 'package:flutter/material.dart';
import 'package:lite_weather_app/ui/screens/weekly_page/weekly_page.dart';
import 'package:sizer/sizer.dart';

import 'package:lite_weather_app/ui/screens/today_page/today_page.dart';

class LiteWeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MaterialApp(
        // title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: WeeklyPage(),
      );
    });
  }
}
