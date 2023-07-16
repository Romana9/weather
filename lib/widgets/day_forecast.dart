import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DayForecast extends StatelessWidget {
  const DayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    List<_SalesData> dataLikes = [
      _SalesData('Mon', 1.0),
      _SalesData('Tue', 4.0),
      _SalesData('Wen', 3.0),
      _SalesData('Thu', 5.0),
      _SalesData('Fri', 0.0),
      _SalesData('Sat', 2.0),
      _SalesData('Sun', 1.0),
    ];
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xffD0BCFF),
            borderRadius: BorderRadius.circular(18.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        "assets/images/calendar.png",
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text("Day forecast", style: TextStyle(fontSize: 14.sp)),
                ],
              ),
              SizedBox(height: 20.h),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  legend: Legend(
                    isVisible: false,
                  ),
                  tooltipBehavior: TooltipBehavior(
                      enable: true,
                      color: const Color.fromARGB(144, 138, 32, 213)),
                  series: <ChartSeries<_SalesData, String>>[
                    SplineAreaSeries<_SalesData, String>(
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(117, 138, 32, 213),
                              Colors.transparent
                            ]),
                        borderColor: const Color(0xff8A20D5),
                        borderWidth: 2,
                        dataSource: dataLikes,
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'viewer',
                        dataLabelSettings: const DataLabelSettings(
                            color: Colors.white, isVisible: true))
                  ]),
            ],
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
