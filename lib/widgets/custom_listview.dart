import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/app_cubit_cubit.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({
    super.key,
    required this.indexx,
  });
  final int indexx;

  @override
  Widget build(BuildContext context) {
    List time = [
      "12AM",
      "1AM",
      "2AM",
      "3AM",
      "4AM",
      "5AM",
      "6AM",
      "7AM",
      "8AM",
      "9AM",
      "10AM",
      "11AM",
      "12PM",
      "1PM",
      "2PM",
      "3PM",
      "4PM",
      "5PM",
      "6PM",
      "7PM",
      "8PM",
      "9PM",
      "10PM",
      "11PM",
    ];
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: AppCubit.get(context).forcast!["hour"].length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Column(
                children: [
                  Text(time[index], style: TextStyle(fontSize: 14.sp)),
                  SizedBox(height: 5.h),
                  Image.asset("assets/images/cloud.png",
                      height: 32.h, width: 32.w),
                  SizedBox(height: 5.h),
                  Text(
                      indexx == 1
                          ? "${AppCubit.get(context).forcastDays![1]["hour"][index]["temp_c"]}°"
                          : "${AppCubit.get(context).forcast!["hour"][index]["temp_c"]}°",
                      style: TextStyle(fontSize: 18.sp)),
                ],
              ),
            );
          }),
    );
  }
}
