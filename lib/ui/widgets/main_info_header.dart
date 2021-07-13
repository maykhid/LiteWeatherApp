import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_icons/weather_icons.dart';

class MainInfoHeader extends StatelessWidget {
  const MainInfoHeader({
    Key? key,
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
                'New Delhi',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),

              // bottom text
              Text(
                'Friday June 30',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 3.h,
              ),

              Text(
                'Light rain',
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          BoxedIcon(
            WeatherIcons.thunderstorm,
            size: 40.sp,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
