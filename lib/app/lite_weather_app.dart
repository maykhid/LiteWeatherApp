import 'package:flutter/material.dart';
import 'package:lite_weather_app/app/base_app/base_view.dart';
import 'package:lite_weather_app/ui/screens/today_page/today_page_viewmodel.dart';
import 'package:lite_weather_app/ui/screens/weekly_page/weekly_page_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LiteWeatherApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LiteWeatherAppState createState() => _LiteWeatherAppState();
}

class _LiteWeatherAppState extends State<LiteWeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => TodayPageViewModel(),
            ),
            ChangeNotifierProvider(
              create: (_) => WeeklyPageViewModel(),
            )
          ],
          builder: (context, _) {
            return MaterialApp(
              // title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              home: BaseView(),
            );
          });
    });
  }
}
