import 'package:flutter/material.dart';
import 'package:lite_weather_app/app/base_app/base_view.dart';
import 'package:lite_weather_app/app/consts/app_colors.dart';
import 'package:lite_weather_app/ui/widgets/main_info_header.dart';
import 'package:lite_weather_app/ui/widgets/screen_header.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_icons/weather_icons.dart';

class WeeklyPage extends StatefulWidget {
  const WeeklyPage({Key? key}) : super(key: key);

  @override
  _WeeklyPageState createState() => _WeeklyPageState();
}

class _WeeklyPageState extends State<WeeklyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          color: AppColors.deepBlue,
          width: MediaQuery.of(context).size.width,
          height: 40.h,
          child: Column(
            children: [
              // screenheader
              ScreenHeader(),

              //
              SizedBox(height: 5.h),

              // main info
              MainInfoHeader(),

              SizedBox(
                height: 5.h,
              ),

              // degree
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '14',
                  style: TextStyle(fontSize: 70.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        //list view
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  height: 8.h,
                  // color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // icon
                      BoxedIcon(
                        WeatherIcons.day_thunderstorm,
                        color: Colors.black,
                      ),

                      // day
                      Text('Sat'),

                      // degrees
                      Text('32/26'),

                      // detail
                      Text('Mostly cloudy with a thunderstorm'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
