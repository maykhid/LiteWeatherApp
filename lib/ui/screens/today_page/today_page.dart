import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_weather_app/core/data_models/helper.dart';
import 'package:lite_weather_app/core/data_models/weather_data_model.dart';
import 'package:lite_weather_app/ui/screens/today_page/today_page_viewmodel.dart';
import 'package:lite_weather_app/ui/widgets/main_info_header.dart';
import 'package:lite_weather_app/ui/widgets/screen_header.dart';
import 'package:lite_weather_app/ui/widgets/specific_details_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_icons/weather_icons.dart';

class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodayPageViewModel>(
      // stream: null,
      builder: (context, model, _) {
        return FutureBuilder<WeatherDataModel>(
          future: model.requestWeatherDataWithLoacation(),
          builder: (context, snapshot) {
            //
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            //
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  //image bg
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.srgbToLinearGamma(),
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/bg_img.jpg',
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 55.h,
                    child: Column(
                      children: [
                        // container search/ham
                        ScreenHeader(),

                        SizedBox(height: 5.h),

                        // location details/ date / weather details
                        MainInfoHeader(snapshot: snapshot.data),

                        SizedBox(
                          height: 20.h,
                        ),

                        // degree
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              // '${snapshot.data!.main.temp}',
                              RoundOff.stringToDouble(
                                  snapshot.data!.main.temp.toString()),
                              style: TextStyle(
                                  fontSize: 70.sp, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // weather details
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFirstRow(model, snapshot),
                          SizedBox(
                            height: 10.h,
                          ),
                          buildSecondRow(snapshot)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("An error occured loading Data"),
                  Text('Make sure locatioon and data connection are active'),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Row buildSecondRow(AsyncSnapshot<WeatherDataModel> snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Wind
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SpecificDetailWidget(
            icon: FaIcon(
              FontAwesomeIcons.wind,
              size: 35.sp,
              color: Colors.black.withOpacity(0.5),
            ),
            detailText: 'Wind',
            dataText: '${snapshot.data!.wind.speed} m/h',
          ),
        ),

        // UV index
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SpecificDetailWidget(
            icon: BoxedIcon(
              WeatherIcons.day_sunny,
              size: 35.sp,
              color: Colors.black.withOpacity(0.5),
            ),
            detailText: 'UV Index',
            dataText: '22',
          ),
        ),
      ],
    );
  }

  Row _buildFirstRow(
      TodayPageViewModel model, AsyncSnapshot<WeatherDataModel> snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // feels like
        InkWell(
          onTap: () => model.requestWeatherDataWithLoacation(),
          child: SpecificDetailWidget(
            icon: BoxedIcon(
              WeatherIcons.thermometer,
              size: 35.sp,
              color: Colors.black.withOpacity(0.5),
            ),
            detailText: 'Feels Like',
            dataText: RoundOff.stringToDouble(
                snapshot.data!.main.feelsLike.toString()),
          ),
        ),

        // humidity
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SpecificDetailWidget(
            icon: BoxedIcon(
              WeatherIcons.raindrops,
              size: 35.sp,
              color: Colors.black.withOpacity(0.5),
            ),
            detailText: 'Humidity',
            dataText: '${snapshot.data!.main.humidity}%',
          ),
        )
      ],
    );
  }
}
