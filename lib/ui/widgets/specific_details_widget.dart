import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
