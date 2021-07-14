import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_weather_app/app/base_app/base_view.dart';
import 'package:lite_weather_app/ui/screens/today_page/today_page_viewmodel.dart';
import 'package:lite_weather_app/ui/widgets/main_info_header.dart';
import 'package:lite_weather_app/ui/widgets/screen_header.dart';
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
        return Column(
          children: [
            //image bg
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              color: Colors.blueAccent.withOpacity(0.9),
              width: MediaQuery.of(context).size.width,
              height: 55.h,
              child: Column(
                children: [
                  // container search/ham
                  ScreenHeader(),
    
                  SizedBox(height: 5.h),
    
                  // location details/ date / weather details
                  MainInfoHeader(),
    
                  SizedBox(
                    height: 20.h,
                  ),
    
                  // degree
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '14',
                        style: TextStyle(fontSize: 70.sp, color: Colors.white),
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
                    Row(
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
                            dataText: '22',
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
                            dataText: '94%',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
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
                            dataText: '13 km/h',
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
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}

class SpecificDetailWidget extends StatelessWidget {
  final String detailText;
  final String dataText;
  final Widget icon;

  const SpecificDetailWidget({
    Key? key,
    required this.dataText,
    required this.detailText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // BoxedIcon(
          //   icon,
          //   size: 35.sp,
          // ),
          icon,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // detail
              Text(
                detailText,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300),
              ),

              // data
              Text(
                dataText,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
