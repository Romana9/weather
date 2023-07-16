import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather/cubit/app_cubit_cubit.dart';
import 'package:weather/pages/days.dart';
import 'package:weather/pages/search.dart';
import '../widgets/custom_gridview.dart';
import '../widgets/custom_percent_listview.dart';
import '../widgets/day_forecast.dart';
import '../widgets/hourly_forecast.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.MMMMd('en_US').format(now);
    String time = DateFormat.jm().format(now);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is GetWeatherLoading) {
          AppCubit.get(context).getWeather();
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: const Color(0xffF6EDFF),
            body: state is GetWeatherLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Color(0xff8A20D5)),
                  )
                : CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                        SliverAppBar(
                          backgroundColor: const Color(0xffF6EDFF),
                          elevation: 0,
                          expandedHeight: 382.h,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              height: 412.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(33.r),
                                  bottomRight: Radius.circular(33.r),
                                ),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/images/background.png",
                                    )),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 23.w, right: 23.w, top: 58.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${AppCubit.get(context).location!["name"]}, ${AppCubit.get(context).location!["country"]}",
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.white)),
                                        InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             const Search()));
                                          },
                                          child: const Icon(Icons.search,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 126.h,
                                    right: 13.38.w,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/cloud and sun 1.png",
                                          height: 107.h,
                                          width: 80.25.w,
                                        ),
                                        SizedBox(height: 3.h),
                                        Text(
                                            AppCubit.get(context).ButtonIndex ==
                                                    1
                                                ? "${AppCubit.get(context).forcastDays![1]["day"]["condition"]["text"]}"
                                                : "${AppCubit.get(context).current!["condition"]["text"]}",
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 126.h,
                                    left: 23.w,
                                    child: Text(
                                        AppCubit.get(context).ButtonIndex == 1
                                            ? "${AppCubit.get(context).forcastDays![1]["hour"][12]["temp_c"]}"
                                            : "${AppCubit.get(context).current!["temp_c"]}°",
                                        style: TextStyle(
                                            fontSize: 112.sp,
                                            color: Colors.white)),
                                  ),
                                  Positioned(
                                    top: 240.h,
                                    left: 90.w,
                                    child: Text(
                                        AppCubit.get(context).ButtonIndex == 1
                                            ? "Feels like ${AppCubit.get(context).forcastDays![1]["hour"][12]["feelslike_c"]}°"
                                            : "Feels like ${AppCubit.get(context).current!["feelslike_c"]}°",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.white)),
                                  ),
                                  Positioned(
                                    // top: 368.h,
                                    bottom: 15.h,
                                    left: 23.w,
                                    child: Text(
                                        AppCubit.get(context).ButtonIndex == 1
                                            ? "Tomorrow, 12 PM"
                                            : "$formattedDate, $time",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.white)),
                                  ),
                                  Positioned(
                                    // top: 348.h,
                                    bottom: 10.h,
                                    right: 23.w,
                                    child: Column(
                                      children: [
                                        Text(
                                            AppCubit.get(context).ButtonIndex ==
                                                    1
                                                ? "Day ${AppCubit.get(context).forcastDays![1]["day"]["maxtemp_c"]}°"
                                                : "Day ${AppCubit.get(context).forcast!["day"]["maxtemp_c"]}°",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.white)),
                                        Text(
                                            AppCubit.get(context).ButtonIndex ==
                                                    1
                                                ? "Night ${AppCubit.get(context).forcastDays![1]["day"]["mintemp_c"]}°"
                                                : "Night ${AppCubit.get(context).forcast!["day"]["mintemp_c"]}°",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            AppCubit.get(context)
                                                .ButtonsIndex(0);
                                          },
                                          child: Container(
                                            height: 42.h,
                                            width: 116.w,
                                            decoration: BoxDecoration(
                                              color: AppCubit.get(context)
                                                          .ButtonIndex ==
                                                      0
                                                  ? const Color(0xffE0B6FF)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                            ),
                                            child: Center(
                                              child: Text('Today',
                                                  style: TextStyle(
                                                      fontSize: 16.sp)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            AppCubit.get(context)
                                                .ButtonsIndex(1);
                                          },
                                          child: Container(
                                            height: 42.h,
                                            width: 116.w,
                                            decoration: BoxDecoration(
                                              color: AppCubit.get(context)
                                                          .ButtonIndex ==
                                                      1
                                                  ? const Color(0xffE0B6FF)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                            ),
                                            child: Center(
                                              child: Text('Tomorrow',
                                                  style: TextStyle(
                                                      fontSize: 16.sp)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Days()));
                                          },
                                          child: Container(
                                            height: 42.h,
                                            width: 116.w,
                                            decoration: BoxDecoration(
                                              color: AppCubit.get(context)
                                                          .ButtonIndex ==
                                                      2
                                                  ? const Color(0xffE0B6FF)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                            ),
                                            child: Center(
                                              child: Text('10 days',
                                                  style: TextStyle(
                                                      fontSize: 16.sp)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 22.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomGridview(
                                          image: "assets/images/air.png",
                                          title: "Wind speed",
                                          text1: AppCubit.get(context)
                                                      .ButtonIndex ==
                                                  1
                                              ? "${AppCubit.get(context).forcastDays![1]["hour"][12]["wind_kph"]} km/h"
                                              : "${AppCubit.get(context).current!["wind_kph"]} km/h",
                                        ),
                                        CustomGridview(
                                          image: "assets/images/rainchance.png",
                                          title: "Rain chance",
                                          text1: AppCubit.get(context)
                                                      .ButtonIndex ==
                                                  1
                                              ? "${AppCubit.get(context).forcastDays![1]["day"]["daily_chance_of_rain"]}%"
                                              : "${AppCubit.get(context).forcast!["day"]["daily_chance_of_rain"]}%",
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomGridview(
                                          image: "assets/images/waves.png",
                                          title: "Pressure",
                                          text1: AppCubit.get(context)
                                                      .ButtonIndex ==
                                                  1
                                              ? "${AppCubit.get(context).forcastDays![1]["hour"][12]["pressure_mb"]} mb"
                                              : "${AppCubit.get(context).current!["pressure_mb"]} mb",
                                        ),
                                        CustomGridview(
                                          image: "assets/images/light_mode.png",
                                          title: "UV Index",
                                          text1: AppCubit.get(context)
                                                      .ButtonIndex ==
                                                  1
                                              ? "${AppCubit.get(context).forcastDays![1]["hour"][12]["uv"]}"
                                              : "${AppCubit.get(context).current!["uv"]}",
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 22.h),
                                    HourlyForecast(
                                      index: AppCubit.get(context).ButtonIndex,
                                    ),
                                    SizedBox(height: 22.h),
                                    const DayForecast(),
                                    SizedBox(height: 24.h),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffD0BCFF),
                                          borderRadius:
                                              BorderRadius.circular(18.r)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 15.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 28.h,
                                                  width: 28.w,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200.r)),
                                                  child: Center(
                                                    child: Image.asset(
                                                      "assets/images/rainchance.png",
                                                      height: 16.h,
                                                      width: 16.w,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                Text("Chance of rain",
                                                    style: TextStyle(
                                                        fontSize: 14.sp)),
                                              ],
                                            ),
                                            const CustomPercentListview()
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomGridview(
                                          image:
                                              "assets/images/nights_stay.png",
                                          title: "Sunrise",
                                          text1: AppCubit.get(context)
                                                      .ButtonIndex ==
                                                  1
                                              ? AppCubit.get(context)
                                                      .forcastDays![1]["astro"]
                                                  ["sunrise"]
                                              : AppCubit.get(context)
                                                  .forcast!["astro"]["sunrise"],
                                        ),
                                        CustomGridview(
                                          image: "assets/images/routine.png",
                                          title: "Sunset",
                                          text1: AppCubit.get(context)
                                                      .ButtonIndex ==
                                                  1
                                              ? AppCubit.get(context)
                                                      .forcastDays![1]["astro"]
                                                  ["sunset"]
                                              : AppCubit.get(context)
                                                  .forcast!["astro"]["sunset"],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ]));
      },
    );
  }
}
