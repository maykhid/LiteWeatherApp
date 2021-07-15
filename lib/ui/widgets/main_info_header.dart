import 'package:flutter/material.dart';
import 'package:lite_weather_app/core/data_models/helper.dart';
import 'package:lite_weather_app/core/data_models/weather_data_model.dart';
import 'package:lite_weather_app/app/extensions/extensions.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_icons/weather_icons.dart';

class MainInfoHeader extends StatelessWidget {
  final WeatherDataModel? snapshot;

  const MainInfoHeader({
    Key? key,
    this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top text
              Text(
                '${snapshot!.name.capitalize()}',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),

              // bottom text
              Text(
                DateFormatter.formatDate(DateTime.now()),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 3.h,
              ),

              Text(
                snapshot!.weather[0].description.capitalize(),
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          BoxedIcon(
            GenerateIcon.getWeatherIcon(snapshot!.weather[0].id),
            size: 40.sp,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
