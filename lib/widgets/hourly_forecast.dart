import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_listview.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffD0BCFF),
          borderRadius: BorderRadius.circular(18.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 28.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(200.r)),
                  child: Center(
                    child: Image.asset(
                      "assets/images/history_toggle_off.png",
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text("Hourly forecast", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            SizedBox(height: 20.h),
            CustomListview(
              indexx: index,
            ),
          ],
        ),
      ),
    );
  }
}
