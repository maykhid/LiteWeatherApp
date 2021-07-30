import 'package:flutter/material.dart';
import 'package:lite_weather_app/app/consts/app_colors.dart';
import 'package:lite_weather_app/app/nav_notifier.dart';
import 'package:lite_weather_app/core/data_models/helper.dart';
import 'package:lite_weather_app/core/data_models/weather_data_model.dart';
import 'package:lite_weather_app/core/data_models/weather_forecast_model.dart';
import 'package:lite_weather_app/ui/screens/weekly_page/weekly_page_viewmodel.dart';
import 'package:lite_weather_app/ui/widgets/main_info_header.dart';
import 'package:lite_weather_app/ui/widgets/screen_header.dart';
import 'package:lite_weather_app/app/extensions/extensions.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../main.dart';

class WeeklyPage extends StatefulWidget {
  const WeeklyPage({Key? key}) : super(key: key);

  @override
  _WeeklyPageState createState() => _WeeklyPageState();
}

class _WeeklyPageState extends State<WeeklyPage> with RouteAware {
  bool _didRouteChange = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // routeObserver is the global variable we created before
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print('didPush');
      var provider = Provider.of<NavigationNotifier>(context, listen: false);
      _didRouteChange = true;
      provider.updateRouteChange(_didRouteChange);
    });
    // if (overlayEntry != null) overlayEntry!.remove();
  }

  // @override
  // void didPopNext() {
  //   // Covering route was popped off the navigator.
  //   print('didPopNext');
  //   // if (overlayEntry != null) overlayEntry!.remove();
  // }

  // @override
  // void didPushNext() {
  //   // Covering route was popped off the navigator.
  //   print('didPushNext');
  //   // if (overlayEntry != null) overlayEntry!.remove();
  // }

  // @override
  // void didPop() {
  //   // Covering route was popped off the navigator.
  //   print('didPop');
  //   // if (overlayEntry != null) overlayEntry!.remove();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeeklyPageViewModel>(
        // stream: null,
        builder: (context, model, __) {
      return FutureBuilder<WeatherDataModel>(
          future: model.requestWeatherDataWithLoacation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            if (snapshot.hasData)
              return Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    color: AppColors.deepBlue,
                    width: MediaQuery.of(context).size.width,
                    height: 47.h,
                    child: Column(
                      children: [
                        // screenheader
                        ScreenHeader(
                          context: context,
                        ),

                        //
                        SizedBox(height: 5.h),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // main info
                              MainInfoHeader(snapshot: snapshot.data),

                              // degree
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  RoundOff.stringToDouble(
                                      snapshot.data!.main.temp.toString()),
                                  style: TextStyle(
                                      fontSize: 70.sp, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //list view
                  Expanded(
                    child: FutureBuilder<WeatherForecastModel>(
                        future: model.requestWeatherForecastWithLocation(),
                        builder: (context, snapshot) {
                          //
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Container(
                              child: Center(child: CircularProgressIndicator()),
                            );

                          //
                          else if (snapshot.hasData &&
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            //
                            var snapshotData = snapshot.data!;
                            //
                            return ListView.builder(
                              itemCount: snapshotData.list.length,
                              itemBuilder: (context, index) {
                                // index = SkipDays.skipIndex(index);
                                return ListTile(
                                  title: Container(
                                    height: 8.h,
                                    // color: Colors.black,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // icon
                                        BoxedIcon(
                                          GenerateIcon.getWeatherIcon(
                                              snapshotData
                                                  .list[index].weather[0].id),
                                          color: Colors.black,
                                        ),

                                        // day
                                        Text(
                                          '${DateFormatter.formatUnix(snapshotData.list[index].dtTxt)}',
                                          style: TextStyle(fontSize: 10.sp),
                                        ),

                                        // degrees
                                        Text(
                                          '${RoundOff.stringToDouble(snapshotData.list[index].main.tempMax.toString())}/${RoundOff.stringToDouble(snapshotData.list[index].main.tempMin.toString())}',
                                          style: TextStyle(fontSize: 10.sp),
                                        ),

                                        // detail
                                        Text(
                                          '${snapshotData.list[index].weather[0].description!.capitalize()}',
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          return Container();
                        }),
                  ),
                ],
              );
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("An error occured!"),
                  Text(
                      'Please turn on location, also check your internet connection'),
                ],
              ),
            );
          });
    });
  }
}
