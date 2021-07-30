import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lite_weather_app/app/base_app/base_view.dart';
import 'package:lite_weather_app/app/nav_notifier.dart';
import 'package:lite_weather_app/core/services/connectivity/network_connectivity.dart';
import 'package:lite_weather_app/ui/screens/today_page/today_page_viewmodel.dart';
import 'package:lite_weather_app/ui/screens/weekly_page/weekly_page_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class LiteWeatherApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LiteWeatherAppState createState() => _LiteWeatherAppState();
}

class _LiteWeatherAppState extends State<LiteWeatherApp> {
  final Connectivity _connectivity = Connectivity();

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
            ),
            ChangeNotifierProvider.value(
              value: NetworkConnectivity.instance(_connectivity),
            ),
            ChangeNotifierProvider(
              create: (_) => NavigationNotifier(),
            ),
          ],
          builder: (context, _) {
            return MaterialApp(
              // title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              navigatorObservers: [routeObserver],
              home: BaseView(),
            );
          });
    });
  }
}
